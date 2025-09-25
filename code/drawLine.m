function drawLine(p1, p2, varargin)
    % varargin{:} 是用于接收额外的参数输入，并将它们传递给 plot 函数。这样可以在绘制线段时指定其他属性，如线的颜色、线型、线宽等 
    plot([p1(1) p2(1)], [p1(2) p2(2)], varargin{:});
    hold on;
end