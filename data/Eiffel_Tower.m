%% ==============================
%  Eiffel Tower Truss Visualization
%  ==============================

clear; clc; close all;

%% 节点坐标 (节点号 X Y Z)
Node = [...
1   50    50     0;
2  -50    50     0;
3  -50   -50     0;
4   50   -50     0;
5   30    30    50;
6  -30    30    50;
7  -30   -30    50;
8   30   -30    50;
9   15    15   100;
10 -15    15   100;
11 -15   -15   100;
12  15   -15   100;
13   5     5   150;
14  -5     5   150;
15  -5    -5   150;
16   5    -5   150;
17   0     0   300];

%% 杆件 (杆件号 节点1 节点2)
Element = [...
1   5    6;
2   6    7;
3   7    8;
4   8    5;
5   9   10;
6   10  11;
7   11  12;
8   12   9;
9   13  14;
10  14  15;
11  15  16;
12  16  13;
13  1    5;
14  5    9;
15  9   13;
16  2    6;
17  6   10;
18  10  14;
19  3    7;
20  7   11;
21  11  15;
22  4    8;
23  8   12;
24  12  16;
25  13  17;
26  14  17;
27  15  17;
28  16  17;
29  1    6;
30  2    7;
31  3    8;
32  4    5;
33  5   10;
34  6   11;
35  7   12;
36  8    9;
37  9   14;
38  10  15;
39  11  16;
40  12  13;
41  5    7;
42  6    8;
43  9   11;
44  10  12;
45  13  15;
46  14  16];

%% 绘制桁架
figure; hold on; grid on; axis equal;
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Simplified Eiffel Tower Truss');

for e = 1:size(Element,1)
    n1 = Element(e,2);
    n2 = Element(e,3);
    X = [Node(n1,2), Node(n2,2)];
    Y = [Node(n1,3), Node(n2,3)];
    Z = [Node(n1,4), Node(n2,4)];
    plot3(X,Y,Z,'k-','LineWidth',1.0);
end

%% 绘制节点
plot3(Node(:,2), Node(:,3), Node(:,4), 'ro','MarkerFaceColor','r');

% 图片调整
ax = gca;
ax.FontName = 'Times New Roman';
ax.FontSize = 18;
ax.LineWidth = 1.5;


%% 可选: 显示节点编号

% for i = 1:size(Node,1)
%     text(Node(i,2), Node(i,3), Node(i,4)+5, num2str(Node(i,1)), ...
%         'FontSize',10,'Color','b');
% end

%% 可选: 显示杆件编号

% for e = 1:size(Element,1)
%     n1 = Element(e,2);
%     n2 = Element(e,3);
%     mid = mean(Node([n1,n2],2:4));
%     text(mid(1), mid(2), mid(3), num2str(Element(e,1)), ...
%         'FontSize',9,'Color','g');
% end


%%

view(30,20);


%%  变形后
scale = 200;

node_dis = [...
   0.00000e+00       0.00000e+00       0.00000e+00
   0.00000e+00       0.00000e+00       0.00000e+00
   0.00000e+00       0.00000e+00       0.00000e+00
   0.00000e+00       0.00000e+00       0.00000e+00
   4.91225e-04      -3.68609e-04       7.86265e-04
   2.22891e-04      -4.26943e-04      -7.90731e-04
   4.91225e-04      -3.68609e-04      -7.86265e-04
   2.22891e-04      -4.26943e-04       7.90731e-04
  -5.94801e-04      -1.17236e-03       1.21630e-03
  -7.58135e-04      -1.21902e-03      -1.35715e-03
  -5.94801e-04      -1.17236e-03      -1.21630e-03
  -7.58135e-04      -1.21902e-03       1.35715e-03
  -4.18932e-03      -4.18784e-03       1.85844e-03
  -4.24765e-03      -4.24618e-03      -2.13763e-03
  -4.18932e-03      -4.18784e-03      -1.85844e-03
  -4.24765e-03      -4.24618e-03       2.13763e-03
  -2.22156e-01      -4.36039e-16       2.99337e-18
];

node_after = Node(:,2:4) + node_dis * scale;

for e = 1:size(Element,1)
    n1 = Element(e,2);
    n2 = Element(e,3);
    X = [node_after(n1,1), node_after(n2,1)];
    Y = [node_after(n1,2), node_after(n2,2)];
    Z = [node_after(n1,3), node_after(n2,3)];
    plot3(X,Y,Z,'m-','LineWidth',1.5);
end



