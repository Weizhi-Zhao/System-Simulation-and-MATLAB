function quick_set_RvsG(app, A_name, B_name)
    % 甲军正规战参数
    app.Spinner_Az_z.Value = 0; % 增援率
    app.Spinner_Az_m.Value = 0; % 命中率
    app.Spinner_Az_s.Value = 0.1; % 射击率
    app.Spinner_Az_c.Value = 0; % 初始兵力
    app.Spinner_Az_f.Value = 0; % 非战斗减员率

    % 甲军游击战参数
    app.Spinner_Ay_z.Value = 50; % 增援率
    app.Spinner_Ay_m.Value = 0.2; % 命中率
    app.Spinner_Ay_s.Value = 0.7; % 射击率
    app.Spinner_Ay_c.Value = 50000; % 初始兵力
    app.Spinner_Ay_f.Value = 0.02; % 非战斗减员率
    app.Spinner_Ay_h.Value = 1000000; % 活动区域面积

    %  乙军正规战参数
    app.Spinner_Bz_z.Value = 100; % 增援率
    app.Spinner_Bz_m.Value = 0.3; % 命中率
    app.Spinner_Bz_s.Value = 0.9; % 射击率
    app.Spinner_Bz_c.Value = 100000; % 初始兵力
    app.Spinner_Bz_f.Value = 0.05; % 非战斗减员率

    % 乙军游击战参数
    app.Spinner_By_z.Value = 0; % 增援率
    app.Spinner_By_m.Value = 0; % 命中率
    app.Spinner_By_s.Value = 0.1; % 射击率
    app.Spinner_By_c.Value = 0; % 初始兵力
    app.Spinner_By_f.Value = 0; % 非战斗减员率
    app.Spinner_By_h.Value = 50; % 活动区域面积

    app.Slider.Value = 16; % 仿真时间

    % 绘制结果
    update_fig(app, A_name, B_name)

end