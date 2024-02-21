function winner_decide(app, A_num, B_num, voice, A_name, B_name)
    % 判断胜负并播报结果
    if A_num >= B_num
        if 0.5 < B_num / A_num && B_num / A_num <= 1
            % 优势方人数不超过劣势方一半，则判断为两败俱伤
            app.Label_Astate.Text = "两败俱伤";
            app.Label_Bstate.Text = "两败俱伤";
            if voice == 1
                tts('两败俱伤');
            end
        elseif B_num < 1
            % 劣势方全灭
            app.Label_Astate.Text = "大胜";
            app.Label_Bstate.Text = "全灭";
            if voice == 1
                for i = 1:3
                    app.Label_Astate.BackgroundColor = [1, 0, 0];
                    pause(0.1);
                    app.Label_Astate.BackgroundColor = 'none';
                    pause(0.1);
                end
                try
                    tts([A_name, '全歼', B_name]);
                end
            end
        else
            % 其他情况
            app.Label_Astate.Text = "战胜";
            app.Label_Bstate.Text = "战败";
            if voice == 1
                for i = 1:3
                    app.Label_Astate.BackgroundColor = [1, 0, 0];
                    pause(0.1);
                    app.Label_Astate.BackgroundColor = 'none';
                    pause(0.1);
                end
                try
                    tts([A_name, '战胜', B_name]);
                end
            end
        end
    else
        if 0.5 < A_num / B_num && A_num / B_num <= 1
            app.Label_Astate.Text = "两败俱伤";
            app.Label_Bstate.Text = "两败俱伤";
            if voice == 1
                tts('两败俱伤');
            end
        elseif A_num < 1
            app.Label_Bstate.Text = "大胜";
            app.Label_Astate.Text = "全灭";
            if voice == 1
                for i = 1:3
                    app.Label_Bstate.BackgroundColor = [1, 0, 0];
                    pause(0.1);
                    app.Label_Bstate.BackgroundColor = 'none';
                    pause(0.1);
                end
                try
                    tts([B_name, '全歼', A_name]);
                end
            end
        else
            app.Label_Bstate.Text = "战胜";
            app.Label_Astate.Text = "战败";
            if voice == 1
                for i = 1:3
                    app.Label_Bstate.BackgroundColor = [1, 0, 0];
                    pause(0.1);
                    app.Label_Bstate.BackgroundColor = 'none';
                    pause(0.1);
                end
                try
                    tts([B_name, '战胜', A_name]);
                end
            end
        end
    end
end