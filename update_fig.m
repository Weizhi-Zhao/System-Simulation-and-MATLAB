function update_fig(app, A_name, B_name)
    app.Label_A.Text = A_name;
    app.Label_B.Text = B_name;

    % 获取仿真时间区间
    value = app.Slider.Value;
    
    % 甲军正规战参数
    A_regular.reinforce = app.Spinner_Az_z.Value;
    A_regular.hit_rate = app.Spinner_Az_m.Value;
    A_regular.shoot_rate = app.Spinner_Az_s.Value;
    A_regular.initial = app.Spinner_Az_c.Value;
    A_regular.attrition = app.Spinner_Az_f.Value;

    % 甲军游击战参数
    A_guerilla.reinforce = app.Spinner_Ay_z.Value;
    A_guerilla.hit_rate = app.Spinner_Ay_m.Value;
    A_guerilla.shoot_rate = app.Spinner_Ay_s.Value;
    A_guerilla.initial = app.Spinner_Ay_c.Value;
    A_guerilla.attrition = app.Spinner_Ay_f.Value;
    A_guerilla.active_area = app.Spinner_Ay_h.Value;

    %  乙军正规战参数
    B_regular.reinforce = app.Spinner_Bz_z.Value;
    B_regular.hit_rate = app.Spinner_Bz_m.Value;
    B_regular.shoot_rate = app.Spinner_Bz_s.Value;
    B_regular.initial = app.Spinner_Bz_c.Value;
    B_regular.attrition = app.Spinner_Bz_f.Value;

    % 乙军游击战参数
    B_guerilla.reinforce = app.Spinner_By_z.Value;
    B_guerilla.hit_rate = app.Spinner_By_m.Value;
    B_guerilla.shoot_rate = app.Spinner_By_s.Value;
    B_guerilla.initial = app.Spinner_By_c.Value;
    B_guerilla.attrition = app.Spinner_By_f.Value;
    B_guerilla.active_area = app.Spinner_By_h.Value;

    % 整合所有参数
    A_arg.regular = A_regular;
    A_arg.guerilla = A_guerilla;
    B_arg.regular = B_regular;
    B_arg.guerilla = B_guerilla;

    % 使用参数求解微分方程
    [t, y] = get_popu_change(A_arg, B_arg, value);

    finish = draw_line_anime(app, t, y, A_name, B_name);
    if finish == 1
        % 若动画未被打断则播报结果
        winner_decide(app, y(end, 1) + y(end, 2), y(end, 3) + y(end, 4) ...
                      , 1, A_name, B_name);
    end
end