function quick_set_rand(app, A_name, B_name)
    % 甲军正规战参数
    app.Spinner_Az_z.Value = unifrnd(1, 200); % 增援率
    app.Spinner_Az_m.Value = unifrnd(0.1, 1); % 命中率
    app.Spinner_Az_s.Value = unifrnd(0.1, 1); % 射击率
    app.Spinner_Az_c.Value = unifrnd(100, 10000); % 初始兵力
    app.Spinner_Az_f.Value = unifrnd(0.001, 0.2); % 非战斗减员率

    % 甲军游击战参数
    app.Spinner_Ay_z.Value = unifrnd(1, 200); % 增援率
    app.Spinner_Ay_m.Value = unifrnd(0.1, 1); % 命中率
    app.Spinner_Ay_s.Value = unifrnd(0.1, 1); % 射击率
    app.Spinner_Ay_c.Value = unifrnd(100, 10000); % 初始兵力
    app.Spinner_Ay_f.Value = unifrnd(0.001, 0.2); % 非战斗减员率
    app.Spinner_Ay_h.Value = unifrnd(10000, 1000000); % 活动区域面积

    %  乙军正规战参数
    app.Spinner_Bz_z.Value = unifrnd(1, 200); % 增援率
    app.Spinner_Bz_m.Value = unifrnd(0.1, 1); % 命中率
    app.Spinner_Bz_s.Value = unifrnd(0.1, 1); % 射击率
    app.Spinner_Bz_c.Value = unifrnd(100, 10000); % 初始兵力
    app.Spinner_Bz_f.Value = unifrnd(0.001, 0.2); % 非战斗减员率

    % 乙军游击战参数
    app.Spinner_By_z.Value = unifrnd(1, 200); % 增援率
    app.Spinner_By_m.Value = unifrnd(0.1, 1); % 命中率
    app.Spinner_By_s.Value = unifrnd(0.1, 1); % 射击率
    app.Spinner_By_c.Value = unifrnd(100, 10000); % 初始兵力
    app.Spinner_By_f.Value = unifrnd(0.001, 0.2); % 非战斗减员率
    app.Spinner_By_h.Value = unifrnd(10000, 1000000); % 活动区域面积

    app.Slider.Value = unifrnd(20, 100); % 仿真时间

    % 绘制结果
    update_fig(app, A_name, B_name)

end