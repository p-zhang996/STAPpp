%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%  绘制桁架结构杆内分布  初始版本
%     2025.09.16
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 节点坐标 (示例)
Node = ...
[0.00000e+00    0.00000e+00 
3.00000e+00    0.00000e+00 
6.00000e+00    0.00000e+00 
9.00000e+00    0.00000e+00 
1.20000e+01    0.00000e+00 
1.50000e+01    0.00000e+00 
0.00000e+00    4.00000e+00 
3.00000e+00    4.00000e+00 
6.00000e+00    4.00000e+00 
9.00000e+00    4.00000e+00 
1.20000e+01    4.00000e+00 
1.50000e+01    4.00000e+00
];

% 杆件连接 (示例)
Element = [ 1        7
 1        2
 2        7
 7        8
 2        8
 2        3
 8        3
 8        9
 3        9
 3        4
 3       10
 4        9
 9       10
 4       10
 4        5
 4       11
10       11
 5       11
 5        6
 5       12
11       12
 6       12
];

% 每根杆的内力 (示例数据)
N = [-4.20000e+03
-5.08220e-12
 5.25000e+03
-3.15000e+03
-4.20000e+03
 3.15000e+03
 5.25000e+03
-6.30000e+03
 1.40000e+03
 5.25000e+03
 1.75000e+03
-1.75000e+03
-5.25000e+03
-1.40000e+03
 2.10000e+03
 3.50000e+03
-4.20000e+03
-2.80000e+03
 2.32831e-12
 3.50000e+03
-2.10000e+03
-2.80000e+03
];  

% 颜色映射
cmap = jet(256); % 使用 jet 色带
cmin = min(N);
cmax = max(N);

figure; 
hold on; axis equal; box on

for e = 1:size(Element,1)
    i = Element(e,1);
    j = Element(e,2);
    x = [Node(i,1), Node(j,1)];
    y = [Node(i,2), Node(j,2)];

    % 当前内力值
    val = N(e);
    % 映射到 colormap
    idx = round((val - cmin)/(cmax - cmin) * (size(cmap,1)-1)) + 1;
    plot(x, y, 'LineWidth', 3, 'Color', cmap(idx,:));
    
end
% 绘制节点
plot(Node(:,1), Node(:,2), 'ko', 'MarkerFaceColor','k');

% 添加标题
title('Internal force');
xlabel('X'); ylabel('Y');

% 绘图区域
coeff = 1.2;
cent_x = (max(Node(:,1)) + min(Node(:,1)))/2;
cent_y = (max(Node(:,2)) + min(Node(:,2)))/2;
width  = (max(Node(:,1)) - min(Node(:,1)))/2;
height = (max(Node(:,2)) - min(Node(:,2)))/2;
xlim([cent_x -  width * coeff, cent_x +  width * coeff]);
% ylim([cent_y - height * coeff, cent_y + height * coeff]);

% 添加 colorbar
colormap(cmap);
caxis([cmin cmax]);
colorbar;


% 图片调整
ax = gca;
ax.FontName = 'Times New Roman';
ax.FontSize = 18;
ax.LineWidth = 1.5;









