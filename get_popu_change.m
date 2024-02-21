function [t, y] = get_popu_change(A_arg, B_arg, time_period)
    % 计算正规战中甲乙两军队的人数变化
    % A_arg中包含甲军的正规战和游击战参数
    % B_arg中包含乙军的正规和游击战战参数

    initial = [A_arg.regular.initial;
               A_arg.guerilla.initial;
               B_arg.regular.initial;
               B_arg.guerilla.initial];
    % 求解微分方程
    [t, y] = ode15s(@(t, y)dydt_war(t, y, A_arg, B_arg) ...
                   , 0:time_period/100:time_period, initial);
end