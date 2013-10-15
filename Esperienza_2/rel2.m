temp = [86
84
82
80
78
75
72
69
66
61
56
50
41
];
t = 1./(temp + 273);

p = p_atm - [300
350
400
450
500
550
600
650
700
750
800
850
900
].*0.000987

p_atm = 727./760;


plot(t, log(p),'o');
hold on;
plot(t, log(p));
