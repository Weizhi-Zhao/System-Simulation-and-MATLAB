function dydt = dydt_war(t, y, A_arg, B_arg)
    % 用于计算正规战和游击战中甲乙两军队人数对时间的导数
    A_r = y(1);
    A_g = y(2);
    B_r = y(3);
    B_g = y(4);
    
    % 非战斗减员率系数
    alpha_r = A_arg.regular.attrition;
    alpha_g = A_arg.guerilla.attrition;
    beta_r = B_arg.regular.attrition;
    beta_g = B_arg.guerilla.attrition;

    % 增援率
    u_r = A_arg.regular.reinforce;
    u_g = A_arg.guerilla.reinforce;
    v_r = B_arg.regular.reinforce;
    v_g = B_arg.guerilla.reinforce;
    
    % 射击率
    r_xr = A_arg.regular.shoot_rate;
    r_xg = A_arg.guerilla.shoot_rate;
    r_yr = B_arg.regular.shoot_rate;
    r_yg = B_arg.guerilla.shoot_rate;

    % 命中率
    p_xr = A_arg.regular.hit_rate;
    p_xg = A_arg.guerilla.hit_rate;
    p_yr = B_arg.regular.hit_rate;
    p_yg = B_arg.guerilla.hit_rate;

    % 有效活动面积
    S_x = A_arg.guerilla.active_area;
    S_y = B_arg.guerilla.active_area;

    % 正规栈部队吸引火力程度
    if A_r * r_xr + A_g * r_xg == 0
        E_x = 0.5;
    else
        E_x = A_r * r_xr / (A_r * r_xr + A_g * r_xg);
    end
    if B_r * r_yr + B_g * r_yg == 0
        E_y = 0.5;
    else
        E_y = B_r * r_yr / (B_r * r_yr + B_g * r_yg);
    end

    % 微分方程
    dxrdt = E_x * (-B_r * r_yr * p_yr - B_g * r_yg * p_yg) ...
            + u_r - alpha_r * A_r;
    dxgdt = (1 - E_x) * ( A_g / S_x ...
                            * ( -B_r * r_yr - B_g * r_yg ) ...
                        ) ...
            + u_g - alpha_g * A_g;
    dyrdt = E_y * (-A_r * r_xr * p_xr - A_g * r_xg * p_xg) ...
            + v_r - beta_r * B_r;
    dygdt = (1 - E_y) * ( B_g / S_y ...
                            * ( -A_r * r_xr - A_g * r_xg ) ...
                        ) ...
            + v_g - beta_g * B_g;

    % 返回参数
    dydt = [dxrdt; 
            dxgdt; 
            dyrdt; 
            dygdt];
end