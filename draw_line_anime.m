function finish = draw_line_anime(app, t, y, A_name, B_name)
    % 清空坐标轴
    cla(app.UIAxes);

    % 设置线条
    a1 = animatedline(app.UIAxes, 'Color', '#00BCD4', 'LineWidth', 0.1);
    a2 = animatedline(app.UIAxes, 'Color', '#B2EBF2', 'LineWidth', 0.1);
    a3 = animatedline(app.UIAxes, 'Color', '#1976D2', 'LineWidth', 3);
    a4 = animatedline(app.UIAxes, 'Color', '#FF9800', 'LineWidth', 0.1);
    a5 = animatedline(app.UIAxes, 'Color', '#FFCDD2', 'LineWidth', 0.1);
    a6 = animatedline(app.UIAxes, 'Color', '#F44336', 'LineWidth', 3);

    % 设置图例
    legend(app.UIAxes... 
           , A_name + "正规战兵力", A_name + "游击战兵力", A_name + "总兵力" ...
           , B_name + "正规战兵力", B_name + "游击战兵力", B_name + "军兵力");

    % 设置坐标轴范围
    axis(app.UIAxes, [0, t(end), 0 ...
        , 1.1 * max(y(1, 1) + y(1, 2), y(1, 3) + y(1, 4))])

    len_t = length(t);
    % 绘制动画
    for k = 1:len_t
        % 判断句柄是否有效
        if isvalid(a1)
            addpoints(a1, t(k) ,y(k, 1));
        else
            % 返回动画未完成标志
            finish = 0;
            return
        end
        if isvalid(a2)
            addpoints(a2, t(k) ,y(k, 2));
        else
            finish = 0;
            return
        end
        if isvalid(a3)
            addpoints(a3, t(k) ,y(k, 1) + y(k, 2));
        else
            finish = 0;
            return
        end
        if isvalid(a4)
            addpoints(a4, t(k) ,y(k, 3));
        else
            finish = 0;
            return
        end
        if isvalid(a5)
            addpoints(a5, t(k) ,y(k, 4));
        else
            finish = 0;
            return
        end
        if isvalid(a6)
            addpoints(a6, t(k) ,y(k, 3) + y(k, 4));
        else
            finish = 0;
            return
        end
        
        % 显示当前动画帧的胜负关系
        winner_decide(app, y(k, 1) + y(k, 2), y(k, 3) + y(k, 4), 0, '', '');

        % 绘制动画并延时
        drawnow limitrate
        pause(1.5 / len_t);
    end
    % 返回动画完成标志
    finish = 1;
end