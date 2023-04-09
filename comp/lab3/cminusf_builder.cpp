/*
 * 声明：本代码为 2020 秋 中国科大编译原理（李诚）课程实验参考实现。
 * 请不要以任何方式，将本代码上传到可以公开访问的站点或仓库
 */

#include "cminusf_builder.hpp"
#include <iostream>
using namespace std;

#define CONST_FP(num) ConstantFP::get((float)num, module.get())
#define CONST_INT(num) ConstantInt::get(num, module.get())
// specially deal with "var = expression" or "var" situation
bool assign_var = false;
// num that is being used or passing from a node to another
Value *cur_num = nullptr;
// function that is being built
Function *cur_fun = nullptr;

// types
Type *VOID_T;
Type *INT1_T;
Type *INT32_T;
Type *INT32PTR_T;
Type *FLOAT_T;
Type *FLOATPTR_T;

/*
 * use CMinusfBuilder::Scope to construct scopes
 * scope.enter: enter a new scope
 * scope.exit: exit current scope
 * scope.push: add a new binding to current scope
 * scope.find: find and return the value bound to the name
 */

void CminusfBuilder::visit(ASTProgram &node)
{
    VOID_T = Type::get_void_type(module.get());
    INT1_T = Type::get_int1_type(module.get());
    INT32_T = Type::get_int32_type(module.get());
    INT32PTR_T = Type::get_int32_ptr_type(module.get());
    FLOAT_T = Type::get_float_type(module.get());
    FLOATPTR_T = Type::get_float_ptr_type(module.get());

    for (auto decl : node.declarations)
    {
        decl->accept(*this);
    }
}

void CminusfBuilder::visit(ASTNum &node)
{
    // notice that num has two types
    if (node.type == TYPE_INT)
        cur_num = CONST_INT(node.i_val);
    else
        cur_num = CONST_FP(node.f_val);
}

void CminusfBuilder::visit(ASTVarDeclaration &node)
{
    if (node.num == nullptr)
    {
        // not an array
        if (scope.in_global())
        {
            // need to be set as global variable
            if (node.type == TYPE_INT)
            {
                auto int_z = ConstantZero::get(INT32_T, module.get());
                auto global_var_int = GlobalVariable::create(node.id, module.get(), INT32_T, false, int_z);
                scope.push(node.id, global_var_int);
            }
            else
            {
                // only int or float in var declaration
                auto fp_z = ConstantZero::get(FLOAT_T, module.get());
                auto global_var_fp = GlobalVariable::create(node.id, module.get(), FLOAT_T, false, fp_z);
                scope.push(node.id, global_var_fp);
            }
        }
        else
        {
            // need to be set as local variable
            // which means just allocate it
            if (node.type == TYPE_INT)
            {
                auto alloca_int = builder->create_alloca(INT32_T);
                scope.push(node.id, alloca_int);
            }
            else
            {
                auto alloca_fp = builder->create_alloca(FLOAT_T);
                scope.push(node.id, alloca_fp);
            }
        }
    }
    else
    {
        // an array
        if (scope.in_global())
        {
            if (node.type == TYPE_INT)
            {
                auto *array_int = ArrayType::get(INT32_T, node.num->i_val);
                auto int_z = ConstantZero::get(array_int, module.get());
                auto global_var_int = GlobalVariable::create(node.id, module.get(), array_int, false, int_z);
                scope.push(node.id, global_var_int);
            }
            else
            {
                auto *array_fp = ArrayType::get(FLOAT_T, node.num.get()->i_val);
                auto fp_z = ConstantZero::get(array_fp, module.get());
                auto global_var_fp = GlobalVariable::create(node.id, module.get(), array_fp, false, fp_z);
                scope.push(node.id, global_var_fp);
            }
        }
        else
        {
            if (node.type == TYPE_INT)
            {
                auto *array_int = ArrayType::get(INT32_T, node.num->i_val);
                scope.push(node.id, builder->create_alloca(array_int));
            }
            else
            {
                auto *array_fp = ArrayType::get(FLOAT_T, node.num->i_val);
                scope.push(node.id, builder->create_alloca(array_fp));
            }
        }
    }
}

void CminusfBuilder::visit(ASTFunDeclaration &node)
{
    FunctionType *fun_type;
    Type *ret_type;
    std::vector<Type *> param_types;
    if (node.type == TYPE_INT)
        ret_type = INT32_T;
    else if (node.type == TYPE_FLOAT)
        ret_type = FLOAT_T;
    else
        ret_type = VOID_T;

    for (auto &param : node.params)
    {
        // store all types of params of this fun
        if (param != nullptr)
        {
            param->accept(*this);
            // actually no need to deal with param individually
            if (param->type == TYPE_INT)
            {
                if (param->isarray)
                    param_types.push_back(INT32PTR_T);
                else
                    param_types.push_back(INT32_T);
            }
            else if (param->type == TYPE_FLOAT)
            {
                if (param->isarray)
                    param_types.push_back(FLOATPTR_T);
                else
                    param_types.push_back(FLOAT_T);
            }
            else
            {
                param_types.push_back(VOID_T);
            }
        }
    }

    fun_type = FunctionType::get(ret_type, param_types);
    auto fun = Function::create(fun_type, node.id, module.get());
    scope.push(node.id, fun);
    // update current function
    cur_fun = fun;
    auto funBB = BasicBlock::create(module.get(), "", fun);
    builder->set_insert_point(funBB);
    scope.enter();
    std::vector<Value *> args;
    for (auto arg = fun->arg_begin(); arg != fun->arg_end(); arg++)
    {
        args.push_back(*arg);
    }
    for (int i = 0; i < node.params.size(); ++i)
    {
        if (node.params[i]->isarray)
        {
            // if is an array, allocate a pointer for it, then store params in it
            if (node.params[i]->type == TYPE_INT)
            {
                auto alloca = builder->create_alloca(INT32PTR_T);
                builder->create_store(args[i], alloca);
                scope.push(node.params[i]->id, alloca);
            }
            else
            {
                auto alloca = builder->create_alloca(FLOATPTR_T);
                builder->create_store(args[i], alloca);
                scope.push(node.params[i]->id, alloca);
            }
        }
        else
        {
            // if not an array
            if (node.params[i]->type == TYPE_INT)
            {
                auto alloca = builder->create_alloca(INT32_T);
                builder->create_store(args[i], alloca);
                scope.push(node.params[i]->id, alloca);
            }
            else
            {
                auto alloca = builder->create_alloca(FLOAT_T);
                builder->create_store(args[i], alloca);
                scope.push(node.params[i]->id, alloca);
            }
        }
    }
    node.compound_stmt->accept(*this);
    // if cur block can't end itself correctly, give it an end
    if (builder->get_insert_block()->get_terminator() == nullptr)
    {
        if (cur_fun->get_return_type()->is_void_type())
            builder->create_void_ret();
        else if (cur_fun->get_return_type()->is_float_type())
            builder->create_ret(CONST_FP(0.));
        else
            builder->create_ret(CONST_INT(0));
    }
    scope.exit();
}

void CminusfBuilder::visit(ASTParam &node)
{
    // we need nothing here
}

void CminusfBuilder::visit(ASTCompoundStmt &node)
{
    // enter a scope means enter a new {} in your code
    scope.enter();
    for (auto &decl : node.local_declarations)
    {
        decl->accept(*this);
    }

    for (auto &stmt : node.statement_list)
    {
        stmt->accept(*this);
        if (builder->get_insert_block()->get_terminator() != nullptr)
            break;
    }
    scope.exit();
}

void CminusfBuilder::visit(ASTExpressionStmt &node)
{
    // just visit its expression, or just do nothing otherwise
    if (node.expression != nullptr)
        node.expression->accept(*this);
}

void CminusfBuilder::visit(ASTSelectionStmt &node)
{
    // we need if, else, and ret
    auto then_bb = BasicBlock::create(module.get(), "", cur_fun);
    auto else_bb = BasicBlock::create(module.get(), "", cur_fun);
    auto ret_bb = BasicBlock::create(module.get(), "", cur_fun);
    // define a value which should be int1 for comparing
    Value *cond_val;
    node.expression->accept(*this);
    // switch cond_val into 1 or 0 in int1 compulsory to avoid using cur_num directly
    if (cur_num->get_type()->is_integer_type())
        cond_val = builder->create_icmp_ne(cur_num, CONST_INT(0));
    else
        cond_val = builder->create_fcmp_ne(cur_num, CONST_FP(0.));

    if (node.else_statement != nullptr)
        builder->create_cond_br(cond_val, then_bb, else_bb);
    else
        builder->create_cond_br(cond_val, then_bb, ret_bb);

    builder->set_insert_point(then_bb);
    node.if_statement->accept(*this);
    // in case some external functions are called which lead to failure of stepping forward to next bb
    // or just create br compulsory
    if (builder->get_insert_block()->get_terminator() == nullptr)
        builder->create_br(ret_bb);

    if (node.else_statement != nullptr)
    {
        builder->set_insert_point(else_bb);
        node.else_statement->accept(*this);
        // next bb is just ret bb so create directly
        builder->create_br(ret_bb);
    }
    else
        // or erase this bb which is going to be empty otherwise
        else_bb->erase_from_parent();

    builder->set_insert_point(ret_bb);
}

void CminusfBuilder::visit(ASTIterationStmt &node)
{
    auto cmp_bb = BasicBlock::create(module.get(), "", cur_fun);
    // need to visit cmp_expr for at least once so just br directly
    builder->create_br(cmp_bb);
    builder->set_insert_point(cmp_bb);
    node.expression->accept(*this);
    // switch cond_val into 1 or 0 compulsory
    Value *cond_val;
    if (cur_num->get_type()->is_integer_type())
        cond_val = builder->create_icmp_ne(cur_num, CONST_INT(0));
    else
        cond_val = builder->create_fcmp_ne(cur_num, CONST_FP(0.));

    auto while_bb = BasicBlock::create(module.get(), "", cur_fun);
    auto next_bb = BasicBlock::create(module.get(), "", cur_fun);

    builder->create_cond_br(cond_val, while_bb, next_bb);
    builder->set_insert_point(while_bb);
    node.statement->accept(*this);
    builder->create_br(cmp_bb);
    builder->set_insert_point(next_bb);
}

void CminusfBuilder::visit(ASTReturnStmt &node)
{
    if (node.expression == nullptr)
        builder->create_void_ret();
    else
    {
        auto ret_ty = cur_fun->get_function_type()->get_return_type();
        node.expression->accept(*this);
        if (ret_ty != cur_num->get_type())
        {
            // ret_ty is prior to cur_num_ty so switch cur_num_ty if necessary
            if (ret_ty->is_integer_type())
                cur_num = builder->create_fptosi(cur_num, INT32_T);
            else
                cur_num = builder->create_sitofp(cur_num, FLOAT_T);
        }
        builder->create_ret(cur_num);
    }
}

void CminusfBuilder::visit(ASTVar &node)
{
    // receive whether need to assign this var or just use this var
    bool is_assign = assign_var;
    // after passing message, initialize it
    assign_var = false;
    // take it out from scope
    auto cur_p = scope.find(node.id);
    // var can be int, float, pointer, array
    auto is_int = cur_p->get_type()->get_pointer_element_type()->is_integer_type();
    auto is_fp = cur_p->get_type()->get_pointer_element_type()->is_float_type();
    auto is_ptr = cur_p->get_type()->get_pointer_element_type()->is_pointer_type();
    auto is_arr = cur_p->get_type()->get_pointer_element_type()->is_array_type();
    if (node.expression == nullptr)
    {
        // just an ID
        if (is_assign)
            // if need to be assigned, just send its address
            cur_num = cur_p;
        else
        {
            if (is_arr) // it's an address to store something
                cur_num = builder->create_gep(cur_p, {CONST_INT(0), CONST_INT(0)});
            else // it's an address storing something
                cur_num = builder->create_load(cur_p);
        }
    }
    else
    {
        // ID[expression]
        node.expression->accept(*this);
        // define is_neg to check if index is negative
        Value *is_neg;
        auto idx = cur_num;
        auto neg_bb = BasicBlock::create(module.get(), "", cur_fun);
        auto nor_bb = BasicBlock::create(module.get(), "", cur_fun);
        // switch index to int compulsory
        if (idx->get_type()->is_float_type())
            idx = builder->create_fptosi(idx, INT32_T);
        is_neg = builder->create_icmp_lt(idx, CONST_INT(0));
        // if index is neg, br to neg_bb to deal with this situation
        builder->create_cond_br(is_neg, neg_bb, nor_bb);
        builder->set_insert_point(neg_bb);
        // call neg_idx_except fun
        auto neg_idx_except_fun = scope.find("neg_idx_except");
        builder->create_call(static_cast<Function *>(neg_idx_except_fun), {});
        // give this bb a return statement in case unable to get back
        if (cur_fun->get_return_type()->is_void_type())
            builder->create_void_ret();
        else if (cur_fun->get_return_type()->is_float_type())
            builder->create_ret(CONST_FP(0.));
        else
            builder->create_ret(CONST_INT(0));

        builder->set_insert_point(nor_bb);
        Value *array_p;
        if (is_ptr)
        {
            // pointer to an array
            auto array_temp = builder->create_load(cur_p);
            array_p = builder->create_gep(array_temp, {idx});
        }
        else if (is_arr)
        {
            // just an array array
            array_p = builder->create_gep(cur_p, {CONST_INT(0), idx});
        }
        else
        {
            // just a fp or an int array
            array_p = builder->create_gep(cur_p, {idx});
        }
        if (is_assign)
            cur_num = array_p;
        else
            cur_num = builder->create_load(array_p);
    }
}

void CminusfBuilder::visit(ASTAssignExpression &node)
{
    node.expression->accept(*this);
    auto expr_res = cur_num;
    // give message that this var need to be assigned
    assign_var = true;
    node.var->accept(*this);
    auto var_p = cur_num;
    // left_ty is prior to right_ty, so switch right_ty
    if (expr_res->get_type() != var_p->get_type()->get_pointer_element_type())
    {
        if (expr_res->get_type()->is_integer_type())
        {
            expr_res = builder->create_sitofp(expr_res, FLOAT_T);
        }
        else
        {
            expr_res = builder->create_fptosi(expr_res, INT32_T);
        }
    }
    // update
    cur_num = expr_res;
    builder->create_store(expr_res, var_p);
}

void CminusfBuilder::visit(ASTSimpleExpression &node)
{
    if (node.additive_expression_r == nullptr)
        node.additive_expression_l->accept(*this);
    else
    {
        node.additive_expression_l->accept(*this);
        auto l_load = cur_num;
        node.additive_expression_r->accept(*this);
        auto r_load = cur_num;
        bool is_int = false;
        // need to unify lty and rty
        if (l_load->get_type() == r_load->get_type())
            is_int = l_load->get_type()->is_integer_type();
        else
        {
            if (l_load->get_type()->is_integer_type())
                l_load = builder->create_sitofp(l_load, FLOAT_T);
            else
                r_load = builder->create_sitofp(r_load, FLOAT_T);
            is_int = false;
        }
        Value *cur_cmp;
        switch (node.op)
        {
        case OP_LE:
            if (is_int)
                cur_cmp = builder->create_icmp_le(l_load, r_load);
            else
                cur_cmp = builder->create_fcmp_le(l_load, r_load);
            break;
        case OP_LT:
            if (is_int)
                cur_cmp = builder->create_icmp_lt(l_load, r_load);
            else
                cur_cmp = builder->create_fcmp_lt(l_load, r_load);
            break;
        case OP_GT:
            if (is_int)
                cur_cmp = builder->create_icmp_gt(l_load, r_load);
            else
                cur_cmp = builder->create_fcmp_gt(l_load, r_load);
            break;
        case OP_GE:
            if (is_int)
                cur_cmp = builder->create_icmp_ge(l_load, r_load);
            else
                cur_cmp = builder->create_fcmp_ge(l_load, r_load);
            break;
        case OP_EQ:
            if (is_int)
                cur_cmp = builder->create_icmp_eq(l_load, r_load);
            else
                cur_cmp = builder->create_fcmp_eq(l_load, r_load);
            break;
        case OP_NEQ:
            if (is_int)
                cur_cmp = builder->create_icmp_ne(l_load, r_load);
            else
                cur_cmp = builder->create_fcmp_ne(l_load, r_load);
            break;
        default:
            std::cout << "relop error" << endl;
            break;
        }
        // cur_cmp is int1 so zext is necessary
        cur_num = builder->create_zext(cur_cmp, INT32_T);
    }
}

void CminusfBuilder::visit(ASTAdditiveExpression &node)
{
    if (node.additive_expression == nullptr)
        node.term->accept(*this);
    else
    {
        node.additive_expression->accept(*this);
        auto l_op = cur_num;
        node.term->accept(*this);
        auto r_op = cur_num;
        bool is_int = false;
        if (l_op->get_type() == r_op->get_type())
            is_int = l_op->get_type()->is_integer_type();
        else
        {
            if (l_op->get_type()->is_integer_type())
                l_op = builder->create_sitofp(l_op, FLOAT_T);
            else
                r_op = builder->create_sitofp(r_op, FLOAT_T);
            is_int = false;
        }
        switch (node.op)
        {
        case OP_PLUS:
            cur_num = is_int ? builder->create_iadd(l_op, r_op) : builder->create_fadd(l_op, r_op);
            break;
        case OP_MINUS:
            cur_num = is_int ? builder->create_isub(l_op, r_op) : builder->create_fsub(l_op, r_op);
            break;
        default:
            std::cout << "op error" << endl;
            break;
        }
    }
}

void CminusfBuilder::visit(ASTTerm &node)
{
    if (node.term == nullptr)
        node.factor->accept(*this);
    else
    {
        node.term->accept(*this);
        auto l_op = cur_num;
        node.factor->accept(*this);
        auto r_op = cur_num;
        bool is_int;
        if (l_op->get_type() == r_op->get_type())
            is_int = l_op->get_type()->is_integer_type();
        else
        {
            if (l_op->get_type()->is_integer_type())
                l_op = builder->create_sitofp(l_op, FLOAT_T);
            else if (r_op->get_type()->is_integer_type())
                r_op = builder->create_sitofp(r_op, FLOAT_T);
            is_int = false;
        }
        switch (node.op)
        {
        case OP_MUL:
            cur_num = is_int ? builder->create_imul(l_op, r_op) : builder->create_fmul(l_op, r_op);
            break;
        case OP_DIV:
            cur_num = is_int ? builder->create_isdiv(l_op, r_op) : builder->create_fdiv(l_op, r_op);
            break;
        default:
            std::cout << "op error" << endl;
            break;
        }
    }
}

void CminusfBuilder::visit(ASTCall &node)
{
    // switch value type to function type
    auto call_fun = static_cast<Function *>(scope.find(node.id));
    std::vector<Value *> call_args;
    // get fun_param lists' pointer to match
    auto fun_param_ty = call_fun->get_function_type()->param_begin();
    for (auto arg : node.args)
    {
        if (arg != nullptr)
        {
            arg->accept(*this);
            // switch type if necessary
            if (*fun_param_ty != cur_num->get_type() && cur_num->get_type()->is_pointer_type() == 0)
            {
                if (cur_num->get_type()->is_integer_type())
                    cur_num = builder->create_sitofp(cur_num, FLOAT_T);
                else
                    cur_num = builder->create_fptosi(cur_num, INT32_T);
            }
            call_args.push_back(cur_num);
            // move forward pointer
            fun_param_ty++;
        }
    }
    cur_num = builder->create_call(call_fun, call_args);
}
