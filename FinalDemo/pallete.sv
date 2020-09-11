module pallete (input [2:0] cidx,
					output logic [7:0] Red, Green, Blue);
	always_comb
		begin	
			case(cidx)
				3'b000:
					begin
						Red = 8'h77;
						Green = 8'h44;
						Blue = 8'h22;
					end
				3'b001:
					begin
						Red = 8'h99;
						Green = 8'h66;
						Blue = 8'h44;
					end
				3'b010:
					begin
						Red = 8'hbb;
						Green = 8'h88;
						Blue = 8'h66;
					end
				3'b011:
					begin
						Red = 8'h00;
						Green = 8'h00;
						Blue = 8'h00;
					end
				3'b100:
					begin
						Red = 8'h44;
						Green = 8'h44;
						Blue = 8'h44;
					end
				3'b101:
					begin
						Red = 8'h4a;
						Green = 8'h4a;
						Blue = 8'h4a;
					end
				3'b110:
					begin
						Red = 8'h66;
						Green = 8'h66;
						Blue = 8'h66;
					end
				default:
					begin
						Red = 8'hff;
						Green = 8'hff;
						Blue = 8'hff;
					end
			endcase
		end
					
					
endmodule			

module pallete2 (input [2:0] cidx,
					output logic [7:0] Red, Green, Blue);
	always_comb
		begin	
			case(cidx)
				3'b000:
					begin
						Red = 98;
						Green = 101;
						Blue = 86;
					end
				3'b001:
					begin
						Red = 74;
						Green = 74;
						Blue = 74;
					end
				3'b010:
					begin
						Red = 159;
						Green = 192;
						Blue = 98;
					end
				3'b011:
					begin
						Red = 233;
						Green = 237;
						Blue = 224;
					end
				3'b100:
					begin
						Red = 224;
						Green = 89;
						Blue = 89;
					end
				3'b101:
					begin
						Red = 131;
						Green = 60;
						Blue = 11;
					end
				3'b110:
					begin
						Red = 237;
						Green = 171;
						Blue = 126;
					end
				default:
					begin
						Red = 8'h00;
						Green = 8'h00;
						Blue = 8'h00;
					end
			endcase
		end
					
					
endmodule			
				
module pallete3 (input [2:0] cidx,
					output logic [7:0] Red, Green, Blue);
	always_comb
		begin	
			case(cidx)
				3'b000:
					begin
						Red = 49;
						Green = 60;
						Blue = 105;
					end
				3'b001:
					begin
						Red = 74;
						Green = 74;
						Blue = 74;
					end
				3'b010:
					begin
						Red = 0;
						Green = 0;
						Blue = 0;
					end
				3'b011:
					begin
						Red = 255;
						Green = 255;
						Blue = 255;
					end
				3'b110:
					begin
						Red = 86;
						Green = 65;
						Blue = 67;
					end
				3'b101:
					begin
						Red = 251;
						Green = 221;
						Blue = 196;
					end
				3'b100:
					begin
						Red = 190;
						Green = 178;
						Blue = 166;
					end
				default:
					begin
						Red = 212;
						Green = 209;
						Blue = 255;
					end
			endcase
		end
					
					
endmodule
	
module palletebig (input [10:0] cidx,
					output logic [7:0] Red, Green, Blue);
	always_comb
		begin	
			case(cidx)
				0:
begin
Red = 31 ;
Green = 31 ;
Blue = 31 ;
end
1:
begin
Red = 31 ;
Green = 31 ;
Blue = 63 ;
end
2:
begin
Red = 31 ;
Green = 31 ;
Blue = 95 ;
end
3:
begin
Red = 31 ;
Green = 31 ;
Blue = 127 ;
end
4:
begin
Red = 31 ;
Green = 31 ;
Blue = 159 ;
end
5:
begin
Red = 31 ;
Green = 31 ;
Blue = 191 ;
end
6:
begin
Red = 31 ;
Green = 31 ;
Blue = 223 ;
end
7:
begin
Red = 31 ;
Green = 31 ;
Blue = 255 ;
end
8:
begin
Red = 31 ;
Green = 63 ;
Blue = 31 ;
end
9:
begin
Red = 31 ;
Green = 63 ;
Blue = 63 ;
end
10:
begin
Red = 31 ;
Green = 63 ;
Blue = 95 ;
end
11:
begin
Red = 31 ;
Green = 63 ;
Blue = 127 ;
end
12:
begin
Red = 31 ;
Green = 63 ;
Blue = 159 ;
end
13:
begin
Red = 31 ;
Green = 63 ;
Blue = 191 ;
end
14:
begin
Red = 31 ;
Green = 63 ;
Blue = 223 ;
end
15:
begin
Red = 31 ;
Green = 63 ;
Blue = 255 ;
end
16:
begin
Red = 31 ;
Green = 95 ;
Blue = 31 ;
end
17:
begin
Red = 31 ;
Green = 95 ;
Blue = 63 ;
end
18:
begin
Red = 31 ;
Green = 95 ;
Blue = 95 ;
end
19:
begin
Red = 31 ;
Green = 95 ;
Blue = 127 ;
end
20:
begin
Red = 31 ;
Green = 95 ;
Blue = 159 ;
end
21:
begin
Red = 31 ;
Green = 95 ;
Blue = 191 ;
end
22:
begin
Red = 31 ;
Green = 95 ;
Blue = 223 ;
end
23:
begin
Red = 31 ;
Green = 95 ;
Blue = 255 ;
end
24:
begin
Red = 31 ;
Green = 127 ;
Blue = 31 ;
end
25:
begin
Red = 31 ;
Green = 127 ;
Blue = 63 ;
end
26:
begin
Red = 31 ;
Green = 127 ;
Blue = 95 ;
end
27:
begin
Red = 31 ;
Green = 127 ;
Blue = 127 ;
end
28:
begin
Red = 31 ;
Green = 127 ;
Blue = 159 ;
end
29:
begin
Red = 31 ;
Green = 127 ;
Blue = 191 ;
end
30:
begin
Red = 31 ;
Green = 127 ;
Blue = 223 ;
end
31:
begin
Red = 31 ;
Green = 127 ;
Blue = 255 ;
end
32:
begin
Red = 31 ;
Green = 159 ;
Blue = 31 ;
end
33:
begin
Red = 31 ;
Green = 159 ;
Blue = 63 ;
end
34:
begin
Red = 31 ;
Green = 159 ;
Blue = 95 ;
end
35:
begin
Red = 31 ;
Green = 159 ;
Blue = 127 ;
end
36:
begin
Red = 31 ;
Green = 159 ;
Blue = 159 ;
end
37:
begin
Red = 31 ;
Green = 159 ;
Blue = 191 ;
end
38:
begin
Red = 31 ;
Green = 159 ;
Blue = 223 ;
end
39:
begin
Red = 31 ;
Green = 159 ;
Blue = 255 ;
end
40:
begin
Red = 31 ;
Green = 191 ;
Blue = 31 ;
end
41:
begin
Red = 31 ;
Green = 191 ;
Blue = 63 ;
end
42:
begin
Red = 31 ;
Green = 191 ;
Blue = 95 ;
end
43:
begin
Red = 31 ;
Green = 191 ;
Blue = 127 ;
end
44:
begin
Red = 31 ;
Green = 191 ;
Blue = 159 ;
end
45:
begin
Red = 31 ;
Green = 191 ;
Blue = 191 ;
end
46:
begin
Red = 31 ;
Green = 191 ;
Blue = 223 ;
end
47:
begin
Red = 31 ;
Green = 191 ;
Blue = 255 ;
end
48:
begin
Red = 31 ;
Green = 223 ;
Blue = 31 ;
end
49:
begin
Red = 31 ;
Green = 223 ;
Blue = 63 ;
end
50:
begin
Red = 31 ;
Green = 223 ;
Blue = 95 ;
end
51:
begin
Red = 31 ;
Green = 223 ;
Blue = 127 ;
end
52:
begin
Red = 31 ;
Green = 223 ;
Blue = 159 ;
end
53:
begin
Red = 31 ;
Green = 223 ;
Blue = 191 ;
end
54:
begin
Red = 31 ;
Green = 223 ;
Blue = 223 ;
end
55:
begin
Red = 31 ;
Green = 223 ;
Blue = 255 ;
end
56:
begin
Red = 31 ;
Green = 255 ;
Blue = 31 ;
end
57:
begin
Red = 31 ;
Green = 255 ;
Blue = 63 ;
end
58:
begin
Red = 31 ;
Green = 255 ;
Blue = 95 ;
end
59:
begin
Red = 31 ;
Green = 255 ;
Blue = 127 ;
end
60:
begin
Red = 31 ;
Green = 255 ;
Blue = 159 ;
end
61:
begin
Red = 31 ;
Green = 255 ;
Blue = 191 ;
end
62:
begin
Red = 31 ;
Green = 255 ;
Blue = 223 ;
end
63:
begin
Red = 31 ;
Green = 255 ;
Blue = 255 ;
end
64:
begin
Red = 63 ;
Green = 31 ;
Blue = 31 ;
end
65:
begin
Red = 63 ;
Green = 31 ;
Blue = 63 ;
end
66:
begin
Red = 63 ;
Green = 31 ;
Blue = 95 ;
end
67:
begin
Red = 63 ;
Green = 31 ;
Blue = 127 ;
end
68:
begin
Red = 63 ;
Green = 31 ;
Blue = 159 ;
end
69:
begin
Red = 63 ;
Green = 31 ;
Blue = 191 ;
end
70:
begin
Red = 63 ;
Green = 31 ;
Blue = 223 ;
end
71:
begin
Red = 63 ;
Green = 31 ;
Blue = 255 ;
end
72:
begin
Red = 63 ;
Green = 63 ;
Blue = 31 ;
end
73:
begin
Red = 63 ;
Green = 63 ;
Blue = 63 ;
end
74:
begin
Red = 63 ;
Green = 63 ;
Blue = 95 ;
end
75:
begin
Red = 63 ;
Green = 63 ;
Blue = 127 ;
end
76:
begin
Red = 63 ;
Green = 63 ;
Blue = 159 ;
end
77:
begin
Red = 63 ;
Green = 63 ;
Blue = 191 ;
end
78:
begin
Red = 63 ;
Green = 63 ;
Blue = 223 ;
end
79:
begin
Red = 63 ;
Green = 63 ;
Blue = 255 ;
end
80:
begin
Red = 63 ;
Green = 95 ;
Blue = 31 ;
end
81:
begin
Red = 63 ;
Green = 95 ;
Blue = 63 ;
end
82:
begin
Red = 63 ;
Green = 95 ;
Blue = 95 ;
end
83:
begin
Red = 63 ;
Green = 95 ;
Blue = 127 ;
end
84:
begin
Red = 63 ;
Green = 95 ;
Blue = 159 ;
end
85:
begin
Red = 63 ;
Green = 95 ;
Blue = 191 ;
end
86:
begin
Red = 63 ;
Green = 95 ;
Blue = 223 ;
end
87:
begin
Red = 63 ;
Green = 95 ;
Blue = 255 ;
end
88:
begin
Red = 63 ;
Green = 127 ;
Blue = 31 ;
end
89:
begin
Red = 63 ;
Green = 127 ;
Blue = 63 ;
end
90:
begin
Red = 63 ;
Green = 127 ;
Blue = 95 ;
end
91:
begin
Red = 63 ;
Green = 127 ;
Blue = 127 ;
end
92:
begin
Red = 63 ;
Green = 127 ;
Blue = 159 ;
end
93:
begin
Red = 63 ;
Green = 127 ;
Blue = 191 ;
end
94:
begin
Red = 63 ;
Green = 127 ;
Blue = 223 ;
end
95:
begin
Red = 63 ;
Green = 127 ;
Blue = 255 ;
end
96:
begin
Red = 63 ;
Green = 159 ;
Blue = 31 ;
end
97:
begin
Red = 63 ;
Green = 159 ;
Blue = 63 ;
end
98:
begin
Red = 63 ;
Green = 159 ;
Blue = 95 ;
end
99:
begin
Red = 63 ;
Green = 159 ;
Blue = 127 ;
end
100:
begin
Red = 63 ;
Green = 159 ;
Blue = 159 ;
end
101:
begin
Red = 63 ;
Green = 159 ;
Blue = 191 ;
end
102:
begin
Red = 63 ;
Green = 159 ;
Blue = 223 ;
end
103:
begin
Red = 63 ;
Green = 159 ;
Blue = 255 ;
end
104:
begin
Red = 63 ;
Green = 191 ;
Blue = 31 ;
end
105:
begin
Red = 63 ;
Green = 191 ;
Blue = 63 ;
end
106:
begin
Red = 63 ;
Green = 191 ;
Blue = 95 ;
end
107:
begin
Red = 63 ;
Green = 191 ;
Blue = 127 ;
end
108:
begin
Red = 63 ;
Green = 191 ;
Blue = 159 ;
end
109:
begin
Red = 63 ;
Green = 191 ;
Blue = 191 ;
end
110:
begin
Red = 63 ;
Green = 191 ;
Blue = 223 ;
end
111:
begin
Red = 63 ;
Green = 191 ;
Blue = 255 ;
end
112:
begin
Red = 63 ;
Green = 223 ;
Blue = 31 ;
end
113:
begin
Red = 63 ;
Green = 223 ;
Blue = 63 ;
end
114:
begin
Red = 63 ;
Green = 223 ;
Blue = 95 ;
end
115:
begin
Red = 63 ;
Green = 223 ;
Blue = 127 ;
end
116:
begin
Red = 63 ;
Green = 223 ;
Blue = 159 ;
end
117:
begin
Red = 63 ;
Green = 223 ;
Blue = 191 ;
end
118:
begin
Red = 63 ;
Green = 223 ;
Blue = 223 ;
end
119:
begin
Red = 63 ;
Green = 223 ;
Blue = 255 ;
end
120:
begin
Red = 63 ;
Green = 255 ;
Blue = 31 ;
end
121:
begin
Red = 63 ;
Green = 255 ;
Blue = 63 ;
end
122:
begin
Red = 63 ;
Green = 255 ;
Blue = 95 ;
end
123:
begin
Red = 63 ;
Green = 255 ;
Blue = 127 ;
end
124:
begin
Red = 63 ;
Green = 255 ;
Blue = 159 ;
end
125:
begin
Red = 63 ;
Green = 255 ;
Blue = 191 ;
end
126:
begin
Red = 63 ;
Green = 255 ;
Blue = 223 ;
end
127:
begin
Red = 63 ;
Green = 255 ;
Blue = 255 ;
end
128:
begin
Red = 95 ;
Green = 31 ;
Blue = 31 ;
end
129:
begin
Red = 95 ;
Green = 31 ;
Blue = 63 ;
end
130:
begin
Red = 95 ;
Green = 31 ;
Blue = 95 ;
end
131:
begin
Red = 95 ;
Green = 31 ;
Blue = 127 ;
end
132:
begin
Red = 95 ;
Green = 31 ;
Blue = 159 ;
end
133:
begin
Red = 95 ;
Green = 31 ;
Blue = 191 ;
end
134:
begin
Red = 95 ;
Green = 31 ;
Blue = 223 ;
end
135:
begin
Red = 95 ;
Green = 31 ;
Blue = 255 ;
end
136:
begin
Red = 95 ;
Green = 63 ;
Blue = 31 ;
end
137:
begin
Red = 95 ;
Green = 63 ;
Blue = 63 ;
end
138:
begin
Red = 95 ;
Green = 63 ;
Blue = 95 ;
end
139:
begin
Red = 95 ;
Green = 63 ;
Blue = 127 ;
end
140:
begin
Red = 95 ;
Green = 63 ;
Blue = 159 ;
end
141:
begin
Red = 95 ;
Green = 63 ;
Blue = 191 ;
end
142:
begin
Red = 95 ;
Green = 63 ;
Blue = 223 ;
end
143:
begin
Red = 95 ;
Green = 63 ;
Blue = 255 ;
end
144:
begin
Red = 95 ;
Green = 95 ;
Blue = 31 ;
end
145:
begin
Red = 95 ;
Green = 95 ;
Blue = 63 ;
end
146:
begin
Red = 95 ;
Green = 95 ;
Blue = 95 ;
end
147:
begin
Red = 95 ;
Green = 95 ;
Blue = 127 ;
end
148:
begin
Red = 95 ;
Green = 95 ;
Blue = 159 ;
end
149:
begin
Red = 95 ;
Green = 95 ;
Blue = 191 ;
end
150:
begin
Red = 95 ;
Green = 95 ;
Blue = 223 ;
end
151:
begin
Red = 95 ;
Green = 95 ;
Blue = 255 ;
end
152:
begin
Red = 95 ;
Green = 127 ;
Blue = 31 ;
end
153:
begin
Red = 95 ;
Green = 127 ;
Blue = 63 ;
end
154:
begin
Red = 95 ;
Green = 127 ;
Blue = 95 ;
end
155:
begin
Red = 95 ;
Green = 127 ;
Blue = 127 ;
end
156:
begin
Red = 95 ;
Green = 127 ;
Blue = 159 ;
end
157:
begin
Red = 95 ;
Green = 127 ;
Blue = 191 ;
end
158:
begin
Red = 95 ;
Green = 127 ;
Blue = 223 ;
end
159:
begin
Red = 95 ;
Green = 127 ;
Blue = 255 ;
end
160:
begin
Red = 95 ;
Green = 159 ;
Blue = 31 ;
end
161:
begin
Red = 95 ;
Green = 159 ;
Blue = 63 ;
end
162:
begin
Red = 95 ;
Green = 159 ;
Blue = 95 ;
end
163:
begin
Red = 95 ;
Green = 159 ;
Blue = 127 ;
end
164:
begin
Red = 95 ;
Green = 159 ;
Blue = 159 ;
end
165:
begin
Red = 95 ;
Green = 159 ;
Blue = 191 ;
end
166:
begin
Red = 95 ;
Green = 159 ;

Blue = 223 ;
end
167:
begin
Red = 95 ;
Green = 159 ;
Blue = 255 ;
end
168:
begin
Red = 95 ;
Green = 191 ;
Blue = 31 ;
end
169:
begin
Red = 95 ;
Green = 191 ;
Blue = 63 ;
end
170:
begin
Red = 95 ;
Green = 191 ;
Blue = 95 ;
end
171:
begin
Red = 95 ;
Green = 191 ;
Blue = 127 ;
end
172:
begin
Red = 95 ;
Green = 191 ;
Blue = 159 ;
end
173:
begin
Red = 95 ;
Green = 191 ;
Blue = 191 ;
end
174:
begin
Red = 95 ;
Green = 191 ;
Blue = 223 ;
end
175:
begin
Red = 95 ;
Green = 191 ;
Blue = 255 ;
end
176:
begin
Red = 95 ;
Green = 223 ;
Blue = 31 ;
end
177:
begin
Red = 95 ;
Green = 223 ;
Blue = 63 ;
end
178:
begin
Red = 95 ;
Green = 223 ;
Blue = 95 ;
end
179:
begin
Red = 95 ;
Green = 223 ;
Blue = 127 ;
end
180:
begin
Red = 95 ;
Green = 223 ;
Blue = 159 ;
end
181:
begin
Red = 95 ;
Green = 223 ;
Blue = 191 ;
end
182:
begin
Red = 95 ;
Green = 223 ;
Blue = 223 ;
end
183:
begin
Red = 95 ;
Green = 223 ;
Blue = 255 ;
end
184:
begin
Red = 95 ;
Green = 255 ;
Blue = 31 ;
end
185:
begin
Red = 95 ;
Green = 255 ;
Blue = 63 ;
end
186:
begin
Red = 95 ;
Green = 255 ;
Blue = 95 ;
end
187:
begin
Red = 95 ;
Green = 255 ;
Blue = 127 ;
end
188:
begin
Red = 95 ;
Green = 255 ;
Blue = 159 ;
end
189:
begin
Red = 95 ;
Green = 255 ;
Blue = 191 ;
end
190:
begin
Red = 95 ;
Green = 255 ;
Blue = 223 ;
end
191:
begin
Red = 95 ;
Green = 255 ;
Blue = 255 ;
end
192:
begin
Red = 127 ;
Green = 31 ;
Blue = 31 ;
end
193:
begin
Red = 127 ;
Green = 31 ;
Blue = 63 ;
end
194:
begin
Red = 127 ;
Green = 31 ;
Blue = 95 ;
end
195:
begin
Red = 127 ;
Green = 31 ;
Blue = 127 ;
end
196:
begin
Red = 127 ;
Green = 31 ;
Blue = 159 ;
end
197:
begin
Red = 127 ;
Green = 31 ;
Blue = 191 ;
end
198:
begin
Red = 127 ;
Green = 31 ;
Blue = 223 ;
end
199:
begin
Red = 127 ;
Green = 31 ;
Blue = 255 ;
end
200:
begin
Red = 127 ;
Green = 63 ;
Blue = 31 ;
end
201:
begin
Red = 127 ;
Green = 63 ;
Blue = 63 ;
end
202:
begin
Red = 127 ;
Green = 63 ;
Blue = 95 ;
end
203:
begin
Red = 127 ;
Green = 63 ;
Blue = 127 ;
end
204:
begin
Red = 127 ;
Green = 63 ;
Blue = 159 ;
end
205:
begin
Red = 127 ;
Green = 63 ;
Blue = 191 ;
end
206:
begin
Red = 127 ;
Green = 63 ;
Blue = 223 ;
end
207:
begin
Red = 127 ;
Green = 63 ;
Blue = 255 ;
end
208:
begin
Red = 127 ;
Green = 95 ;
Blue = 31 ;
end
209:
begin
Red = 127 ;
Green = 95 ;
Blue = 63 ;
end
210:
begin
Red = 127 ;
Green = 95 ;
Blue = 95 ;
end
211:
begin
Red = 127 ;
Green = 95 ;
Blue = 127 ;
end
212:
begin
Red = 127 ;
Green = 95 ;
Blue = 159 ;
end
213:
begin
Red = 127 ;
Green = 95 ;
Blue = 191 ;
end
214:
begin
Red = 127 ;
Green = 95 ;
Blue = 223 ;
end
215:
begin
Red = 127 ;
Green = 95 ;
Blue = 255 ;
end
216:
begin
Red = 127 ;
Green = 127 ;
Blue = 31 ;
end
217:
begin
Red = 127 ;
Green = 127 ;
Blue = 63 ;
end
218:
begin
Red = 127 ;
Green = 127 ;
Blue = 95 ;
end
219:
begin
Red = 127 ;
Green = 127 ;
Blue = 127 ;
end
220:
begin
Red = 127 ;
Green = 127 ;
Blue = 159 ;
end
221:
begin
Red = 127 ;
Green = 127 ;
Blue = 191 ;
end
222:
begin
Red = 127 ;
Green = 127 ;
Blue = 223 ;
end
223:
begin
Red = 127 ;
Green = 127 ;
Blue = 255 ;
end
224:
begin
Red = 127 ;
Green = 159 ;
Blue = 31 ;
end
225:
begin
Red = 127 ;
Green = 159 ;
Blue = 63 ;
end
226:
begin
Red = 127 ;
Green = 159 ;
Blue = 95 ;
end
227:
begin
Red = 127 ;
Green = 159 ;
Blue = 127 ;
end
228:
begin
Red = 127 ;
Green = 159 ;
Blue = 159 ;
end
229:
begin
Red = 127 ;
Green = 159 ;
Blue = 191 ;
end
230:
begin
Red = 127 ;
Green = 159 ;
Blue = 223 ;
end
231:
begin
Red = 127 ;
Green = 159 ;
Blue = 255 ;
end
232:
begin
Red = 127 ;
Green = 191 ;
Blue = 31 ;
end
233:
begin
Red = 127 ;
Green = 191 ;
Blue = 63 ;
end
234:
begin
Red = 127 ;
Green = 191 ;
Blue = 95 ;
end
235:
begin
Red = 127 ;
Green = 191 ;
Blue = 127 ;
end
236:
begin
Red = 127 ;
Green = 191 ;
Blue = 159 ;
end
237:
begin
Red = 127 ;
Green = 191 ;
Blue = 191 ;
end
238:
begin
Red = 127 ;
Green = 191 ;
Blue = 223 ;
end
239:
begin
Red = 127 ;
Green = 191 ;
Blue = 255 ;
end
240:
begin
Red = 127 ;
Green = 223 ;
Blue = 31 ;
end
241:
begin
Red = 127 ;
Green = 223 ;
Blue = 63 ;
end
242:
begin
Red = 127 ;
Green = 223 ;
Blue = 95 ;
end
243:
begin
Red = 127 ;
Green = 223 ;
Blue = 127 ;
end
244:
begin
Red = 127 ;
Green = 223 ;
Blue = 159 ;
end
245:
begin
Red = 127 ;
Green = 223 ;
Blue = 191 ;
end
246:
begin
Red = 127 ;
Green = 223 ;
Blue = 223 ;
end
247:
begin
Red = 127 ;
Green = 223 ;
Blue = 255 ;
end
248:
begin
Red = 127 ;
Green = 255 ;
Blue = 31 ;
end
249:
begin
Red = 127 ;
Green = 255 ;
Blue = 63 ;
end
250:
begin
Red = 127 ;
Green = 255 ;
Blue = 95 ;
end
251:
begin
Red = 127 ;
Green = 255 ;
Blue = 127 ;
end
252:
begin
Red = 127 ;
Green = 255 ;
Blue = 159 ;
end
253:
begin
Red = 127 ;
Green = 255 ;
Blue = 191 ;
end
254:
begin
Red = 127 ;
Green = 255 ;
Blue = 223 ;
end
255:
begin
Red = 127 ;
Green = 255 ;
Blue = 255 ;
end
256:
begin
Red = 159 ;
Green = 31 ;
Blue = 31 ;
end
257:
begin
Red = 159 ;
Green = 31 ;
Blue = 63 ;
end
258:
begin
Red = 159 ;
Green = 31 ;
Blue = 95 ;
end
259:
begin
Red = 159 ;
Green = 31 ;
Blue = 127 ;
end
260:
begin
Red = 159 ;
Green = 31 ;
Blue = 159 ;
end
261:
begin
Red = 159 ;
Green = 31 ;
Blue = 191 ;
end
262:
begin
Red = 159 ;
Green = 31 ;
Blue = 223 ;
end
263:
begin
Red = 159 ;
Green = 31 ;
Blue = 255 ;
end
264:
begin
Red = 159 ;
Green = 63 ;
Blue = 31 ;
end
265:
begin
Red = 159 ;
Green = 63 ;
Blue = 63 ;
end
266:
begin
Red = 159 ;
Green = 63 ;
Blue = 95 ;
end
267:
begin
Red = 159 ;
Green = 63 ;
Blue = 127 ;
end
268:
begin
Red = 159 ;
Green = 63 ;
Blue = 159 ;
end
269:
begin
Red = 159 ;
Green = 63 ;
Blue = 191 ;
end
270:
begin
Red = 159 ;
Green = 63 ;
Blue = 223 ;
end
271:
begin
Red = 159 ;
Green = 63 ;
Blue = 255 ;
end
272:
begin
Red = 159 ;
Green = 95 ;
Blue = 31 ;
end
273:
begin
Red = 159 ;
Green = 95 ;
Blue = 63 ;
end
274:
begin
Red = 159 ;
Green = 95 ;
Blue = 95 ;
end
275:
begin
Red = 159 ;
Green = 95 ;
Blue = 127 ;
end
276:
begin
Red = 159 ;
Green = 95 ;
Blue = 159 ;
end
277:
begin
Red = 159 ;
Green = 95 ;
Blue = 191 ;
end
278:
begin
Red = 159 ;
Green = 95 ;
Blue = 223 ;
end
279:
begin
Red = 159 ;
Green = 95 ;
Blue = 255 ;
end
280:
begin
Red = 159 ;
Green = 127 ;
Blue = 31 ;
end
281:
begin
Red = 159 ;
Green = 127 ;
Blue = 63 ;
end
282:
begin
Red = 159 ;
Green = 127 ;
Blue = 95 ;
end
283:
begin
Red = 159 ;
Green = 127 ;
Blue = 127 ;
end
284:
begin
Red = 159 ;
Green = 127 ;
Blue = 159 ;
end
285:
begin
Red = 159 ;
Green = 127 ;
Blue = 191 ;
end
286:
begin
Red = 159 ;
Green = 127 ;
Blue = 223 ;
end
287:
begin
Red = 159 ;
Green = 127 ;
Blue = 255 ;
end
288:
begin
Red = 159 ;
Green = 159 ;
Blue = 31 ;
end
289:
begin
Red = 159 ;
Green = 159 ;
Blue = 63 ;
end
290:
begin
Red = 159 ;
Green = 159 ;
Blue = 95 ;
end
291:
begin
Red = 159 ;
Green = 159 ;
Blue = 127 ;
end
292:
begin
Red = 159 ;
Green = 159 ;
Blue = 159 ;
end
293:
begin
Red = 159 ;
Green = 159 ;
Blue = 191 ;
end
294:
begin
Red = 159 ;
Green = 159 ;
Blue = 223 ;
end
295:
begin
Red = 159 ;
Green = 159 ;
Blue = 255 ;
end
296:
begin
Red = 159 ;
Green = 191 ;
Blue = 31 ;
end
297:
begin
Red = 159 ;
Green = 191 ;
Blue = 63 ;
end
298:
begin
Red = 159 ;
Green = 191 ;
Blue = 95 ;
end
299:
begin
Red = 159 ;
Green = 191 ;
Blue = 127 ;
end
300:
begin
Red = 159 ;
Green = 191 ;
Blue = 159 ;
end
301:
begin
Red = 159 ;
Green = 191 ;
Blue = 191 ;
end
302:
begin
Red = 159 ;
Green = 191 ;
Blue = 223 ;
end
303:
begin
Red = 159 ;
Green = 191 ;
Blue = 255 ;
end
304:
begin
Red = 159 ;
Green = 223 ;
Blue = 31 ;
end
305:
begin
Red = 159 ;
Green = 223 ;
Blue = 63 ;
end
306:
begin
Red = 159 ;
Green = 223 ;
Blue = 95 ;
end
307:
begin
Red = 159 ;
Green = 223 ;
Blue = 127 ;
end
308:
begin
Red = 159 ;
Green = 223 ;
Blue = 159 ;
end
309:
begin
Red = 159 ;
Green = 223 ;
Blue = 191 ;
end
310:
begin
Red = 159 ;
Green = 223 ;
Blue = 223 ;
end
311:
begin
Red = 159 ;
Green = 223 ;
Blue = 255 ;
end
312:
begin
Red = 159 ;
Green = 255 ;
Blue = 31 ;
end
313:
begin
Red = 159 ;
Green = 255 ;
Blue = 63 ;
end
314:
begin
Red = 159 ;
Green = 255 ;
Blue = 95 ;
end
315:
begin
Red = 159 ;
Green = 255 ;
Blue = 127 ;
end
316:
begin
Red = 159 ;
Green = 255 ;
Blue = 159 ;
end
317:
begin
Red = 159 ;
Green = 255 ;
Blue = 191 ;
end
318:
begin
Red = 159 ;
Green = 255 ;
Blue = 223 ;
end
319:
begin
Red = 159 ;
Green = 255 ;
Blue = 255 ;
end
320:
begin
Red = 191 ;
Green = 31 ;
Blue = 31 ;
end
321:
begin
Red = 191 ;
Green = 31 ;
Blue = 63 ;
end
322:
begin
Red = 191 ;
Green = 31 ;
Blue = 95 ;
end
323:
begin
Red = 191 ;
Green = 31 ;
Blue = 127 ;
end
324:
begin
Red = 191 ;
Green = 31 ;
Blue = 159 ;
end
325:
begin
Red = 191 ;
Green = 31 ;
Blue = 191 ;
end
326:
begin
Red = 191 ;
Green = 31 ;
Blue = 223 ;
end
327:
begin
Red = 191 ;
Green = 31 ;
Blue = 255 ;
end
328:
begin
Red = 191 ;
Green = 63 ;
Blue = 31 ;
end
329:
begin
Red = 191 ;
Green = 63 ;
Blue = 63 ;
end
330:
begin
Red = 191 ;
Green = 63 ;
Blue = 95 ;
end
331:
begin
Red = 191 ;
Green = 63 ;
Blue = 127 ;
end
332:
begin
Red = 191 ;
Green = 63 ;
Blue = 159 ;
end
333:
begin
Red = 191 ;
Green = 63 ;
Blue = 191 ;
end
334:
begin
Red = 191 ;
Green = 63 ;
Blue = 223 ;
end
335:
begin
Red = 191 ;
Green = 63 ;
Blue = 255 ;
end
336:
begin
Red = 191 ;
Green = 95 ;
Blue = 31 ;
end
337:
begin
Red = 191 ;
Green = 95 ;
Blue = 63 ;
end
338:
begin
Red = 191 ;
Green = 95 ;
Blue = 95 ;
end
339:
begin
Red = 191 ;
Green = 95 ;
Blue = 127 ;
end
340:
begin
Red = 191 ;
Green = 95 ;
Blue = 159 ;
end
341:
begin
Red = 191 ;
Green = 95 ;
Blue = 191 ;
end
342:
begin
Red = 191 ;
Green = 95 ;
Blue = 223 ;
end
343:
begin
Red = 191 ;
Green = 95 ;
Blue = 255 ;
end
344:
begin
Red = 191 ;
Green = 127 ;
Blue = 31 ;
end
345:
begin
Red = 191 ;
Green = 127 ;
Blue = 63 ;
end
346:
begin
Red = 191 ;
Green = 127 ;
Blue = 95 ;
end
347:
begin
Red = 191 ;
Green = 127 ;
Blue = 127 ;
end
348:
begin
Red = 191 ;
Green = 127 ;
Blue = 159 ;
end
349:
begin
Red = 191 ;
Green = 127 ;
Blue = 191 ;
end
350:
begin
Red = 191 ;
Green = 127 ;
Blue = 223 ;
end
351:
begin
Red = 191 ;
Green = 127 ;
Blue = 255 ;
end
352:
begin
Red = 191 ;
Green = 159 ;
Blue = 31 ;
end
353:
begin
Red = 191 ;
Green = 159 ;
Blue = 63 ;
end
354:
begin
Red = 191 ;
Green = 159 ;
Blue = 95 ;
end
355:
begin
Red = 191 ;
Green = 159 ;
Blue = 127 ;
end
356:
begin
Red = 191 ;
Green = 159 ;
Blue = 159 ;
end
357:
begin
Red = 191 ;
Green = 159 ;
Blue = 191 ;
end
358:
begin
Red = 191 ;
Green = 159 ;
Blue = 223 ;
end
359:
begin
Red = 191 ;
Green = 159 ;
Blue = 255 ;
end
360:
begin
Red = 191 ;
Green = 191 ;
Blue = 31 ;
end
361:
begin
Red = 191 ;
Green = 191 ;
Blue = 63 ;
end
362:
begin
Red = 191 ;
Green = 191 ;
Blue = 95 ;
end
363:
begin
Red = 191 ;
Green = 191 ;
Blue = 127 ;
end
364:
begin
Red = 191 ;
Green = 191 ;
Blue = 159 ;
end
365:
begin
Red = 191 ;
Green = 191 ;
Blue = 191 ;
end
366:
begin
Red = 191 ;
Green = 191 ;
Blue = 223 ;
end
367:
begin
Red = 191 ;
Green = 191 ;
Blue = 255 ;
end
368:
begin
Red = 191 ;
Green = 223 ;
Blue = 31 ;
end
369:
begin
Red = 191 ;
Green = 223 ;
Blue = 63 ;
end
370:
begin
Red = 191 ;
Green = 223 ;
Blue = 95 ;
end
371:
begin
Red = 191 ;
Green = 223 ;
Blue = 127 ;
end
372:
begin
Red = 191 ;
Green = 223 ;
Blue = 159 ;
end
373:
begin
Red = 191 ;
Green = 223 ;
Blue = 191 ;
end
374:
begin
Red = 191 ;
Green = 223 ;
Blue = 223 ;
end
375:
begin
Red = 191 ;
Green = 223 ;
Blue = 255 ;
end
376:
begin
Red = 191 ;
Green = 255 ;
Blue = 31 ;
end
377:
begin
Red = 191 ;
Green = 255 ;
Blue = 63 ;
end
378:
begin
Red = 191 ;
Green = 255 ;
Blue = 95 ;
end
379:
begin
Red = 191 ;
Green = 255 ;
Blue = 127 ;
end
380:
begin
Red = 191 ;
Green = 255 ;
Blue = 159 ;
end
381:
begin
Red = 191 ;
Green = 255 ;
Blue = 191 ;
end
382:
begin
Red = 191 ;
Green = 255 ;
Blue = 223 ;
end
383:
begin
Red = 191 ;
Green = 255 ;
Blue = 255 ;
end
384:
begin
Red = 223 ;
Green = 31 ;
Blue = 31 ;
end
385:
begin
Red = 223 ;
Green = 31 ;
Blue = 63 ;
end
386:
begin
Red = 223 ;
Green = 31 ;
Blue = 95 ;
end
387:
begin
Red = 223 ;
Green = 31 ;
Blue = 127 ;
end
388:
begin
Red = 223 ;
Green = 31 ;
Blue = 159 ;
end
389:
begin
Red = 223 ;
Green = 31 ;
Blue = 191 ;
end
390:
begin
Red = 223 ;
Green = 31 ;
Blue = 223 ;
end
391:
begin
Red = 223 ;
Green = 31 ;
Blue = 255 ;
end
392:
begin
Red = 223 ;
Green = 63 ;
Blue = 31 ;
end
393:
begin
Red = 223 ;
Green = 63 ;
Blue = 63 ;
end
394:
begin
Red = 223 ;
Green = 63 ;
Blue = 95 ;
end
395:
begin
Red = 223 ;
Green = 63 ;
Blue = 127 ;
end
396:
begin
Red = 223 ;
Green = 63 ;
Blue = 159 ;
end
397:
begin
Red = 223 ;

Green = 63 ;
Blue = 191 ;
end
398:
begin
Red = 223 ;
Green = 63 ;
Blue = 223 ;
end
399:
begin
Red = 223 ;
Green = 63 ;
Blue = 255 ;
end
400:
begin
Red = 223 ;
Green = 95 ;
Blue = 31 ;
end
401:
begin
Red = 223 ;
Green = 95 ;
Blue = 63 ;
end
402:
begin
Red = 223 ;
Green = 95 ;
Blue = 95 ;
end
403:
begin
Red = 223 ;
Green = 95 ;
Blue = 127 ;
end
404:
begin
Red = 223 ;
Green = 95 ;
Blue = 159 ;
end
405:
begin
Red = 223 ;
Green = 95 ;
Blue = 191 ;
end
406:
begin
Red = 223 ;
Green = 95 ;
Blue = 223 ;
end
407:
begin
Red = 223 ;
Green = 95 ;
Blue = 255 ;
end
408:
begin
Red = 223 ;
Green = 127 ;
Blue = 31 ;
end
409:
begin
Red = 223 ;
Green = 127 ;
Blue = 63 ;
end
410:
begin
Red = 223 ;
Green = 127 ;
Blue = 95 ;
end
411:
begin
Red = 223 ;
Green = 127 ;
Blue = 127 ;
end
412:
begin
Red = 223 ;
Green = 127 ;
Blue = 159 ;
end
413:
begin
Red = 223 ;
Green = 127 ;
Blue = 191 ;
end
414:
begin
Red = 223 ;
Green = 127 ;
Blue = 223 ;
end
415:
begin
Red = 223 ;
Green = 127 ;
Blue = 255 ;
end
416:
begin
Red = 223 ;
Green = 159 ;
Blue = 31 ;
end
417:
begin
Red = 223 ;
Green = 159 ;
Blue = 63 ;
end
418:
begin
Red = 223 ;
Green = 159 ;
Blue = 95 ;
end
419:
begin
Red = 223 ;
Green = 159 ;
Blue = 127 ;
end
420:
begin
Red = 223 ;
Green = 159 ;
Blue = 159 ;
end
421:
begin
Red = 223 ;
Green = 159 ;
Blue = 191 ;
end
422:
begin
Red = 223 ;
Green = 159 ;
Blue = 223 ;
end
423:
begin
Red = 223 ;
Green = 159 ;
Blue = 255 ;
end
424:
begin
Red = 223 ;
Green = 191 ;
Blue = 31 ;
end
425:
begin
Red = 223 ;
Green = 191 ;
Blue = 63 ;
end
426:
begin
Red = 223 ;
Green = 191 ;
Blue = 95 ;
end
427:
begin
Red = 223 ;
Green = 191 ;
Blue = 127 ;
end
428:
begin
Red = 223 ;
Green = 191 ;
Blue = 159 ;
end
429:
begin
Red = 223 ;
Green = 191 ;
Blue = 191 ;
end
430:
begin
Red = 223 ;
Green = 191 ;
Blue = 223 ;
end
431:
begin
Red = 223 ;
Green = 191 ;
Blue = 255 ;
end
432:
begin
Red = 223 ;
Green = 223 ;
Blue = 31 ;
end
433:
begin
Red = 223 ;
Green = 223 ;
Blue = 63 ;
end
434:
begin
Red = 223 ;
Green = 223 ;
Blue = 95 ;
end
435:
begin
Red = 223 ;
Green = 223 ;
Blue = 127 ;
end
436:
begin
Red = 223 ;
Green = 223 ;
Blue = 159 ;
end
437:
begin
Red = 223 ;
Green = 223 ;
Blue = 191 ;
end
438:
begin
Red = 223 ;
Green = 223 ;
Blue = 223 ;
end
439:
begin
Red = 223 ;
Green = 223 ;
Blue = 255 ;
end
440:
begin
Red = 223 ;
Green = 255 ;
Blue = 31 ;
end
441:
begin
Red = 223 ;
Green = 255 ;
Blue = 63 ;
end
442:
begin
Red = 223 ;
Green = 255 ;
Blue = 95 ;
end
443:
begin
Red = 223 ;
Green = 255 ;
Blue = 127 ;
end
444:
begin
Red = 223 ;
Green = 255 ;
Blue = 159 ;
end
445:
begin
Red = 223 ;
Green = 255 ;
Blue = 191 ;
end
446:
begin
Red = 223 ;
Green = 255 ;
Blue = 223 ;
end
447:
begin
Red = 223 ;
Green = 255 ;
Blue = 255 ;
end
448:
begin
Red = 255 ;
Green = 31 ;
Blue = 31 ;
end
449:
begin
Red = 255 ;
Green = 31 ;
Blue = 63 ;
end
450:
begin
Red = 255 ;
Green = 31 ;
Blue = 95 ;
end
451:
begin
Red = 255 ;
Green = 31 ;
Blue = 127 ;
end
452:
begin
Red = 255 ;
Green = 31 ;
Blue = 159 ;
end
453:
begin
Red = 255 ;
Green = 31 ;
Blue = 191 ;
end
454:
begin
Red = 255 ;
Green = 31 ;
Blue = 223 ;
end
455:
begin
Red = 255 ;
Green = 31 ;
Blue = 255 ;
end
456:
begin
Red = 255 ;
Green = 63 ;
Blue = 31 ;
end
457:
begin
Red = 255 ;
Green = 63 ;
Blue = 63 ;
end
458:
begin
Red = 255 ;
Green = 63 ;
Blue = 95 ;
end
459:
begin
Red = 255 ;
Green = 63 ;
Blue = 127 ;
end
460:
begin
Red = 255 ;
Green = 63 ;
Blue = 159 ;
end
461:
begin
Red = 255 ;
Green = 63 ;
Blue = 191 ;
end
462:
begin
Red = 255 ;
Green = 63 ;
Blue = 223 ;
end
463:
begin
Red = 255 ;
Green = 63 ;
Blue = 255 ;
end
464:
begin
Red = 255 ;
Green = 95 ;
Blue = 31 ;
end
465:
begin
Red = 255 ;
Green = 95 ;
Blue = 63 ;
end
466:
begin
Red = 255 ;
Green = 95 ;
Blue = 95 ;
end
467:
begin
Red = 255 ;
Green = 95 ;
Blue = 127 ;
end
468:
begin
Red = 255 ;
Green = 95 ;
Blue = 159 ;
end
469:
begin
Red = 255 ;
Green = 95 ;
Blue = 191 ;
end
470:
begin
Red = 255 ;
Green = 95 ;
Blue = 223 ;
end
471:
begin
Red = 255 ;
Green = 95 ;
Blue = 255 ;
end
472:
begin
Red = 255 ;
Green = 127 ;
Blue = 31 ;
end
473:
begin
Red = 255 ;
Green = 127 ;
Blue = 63 ;
end
474:
begin
Red = 255 ;
Green = 127 ;
Blue = 95 ;
end
475:
begin
Red = 255 ;
Green = 127 ;
Blue = 127 ;
end
476:
begin
Red = 255 ;
Green = 127 ;
Blue = 159 ;
end
477:
begin
Red = 255 ;
Green = 127 ;
Blue = 191 ;
end
478:
begin
Red = 255 ;
Green = 127 ;
Blue = 223 ;
end
479:
begin
Red = 255 ;
Green = 127 ;
Blue = 255 ;
end
480:
begin
Red = 255 ;
Green = 159 ;
Blue = 31 ;
end
481:
begin
Red = 255 ;
Green = 159 ;
Blue = 63 ;
end
482:
begin
Red = 255 ;
Green = 159 ;
Blue = 95 ;
end
483:
begin
Red = 255 ;
Green = 159 ;
Blue = 127 ;
end
484:
begin
Red = 255 ;
Green = 159 ;
Blue = 159 ;
end
485:
begin
Red = 255 ;
Green = 159 ;
Blue = 191 ;
end
486:
begin
Red = 255 ;
Green = 159 ;
Blue = 223 ;
end
487:
begin
Red = 255 ;
Green = 159 ;
Blue = 255 ;
end
488:
begin
Red = 255 ;
Green = 191 ;
Blue = 31 ;
end
489:
begin
Red = 255 ;
Green = 191 ;
Blue = 63 ;
end
490:
begin
Red = 255 ;
Green = 191 ;
Blue = 95 ;
end
491:
begin
Red = 255 ;
Green = 191 ;
Blue = 127 ;
end
492:
begin
Red = 255 ;
Green = 191 ;
Blue = 159 ;
end
493:
begin
Red = 255 ;
Green = 191 ;
Blue = 191 ;
end
494:
begin
Red = 255 ;
Green = 191 ;
Blue = 223 ;
end
495:
begin
Red = 255 ;
Green = 191 ;
Blue = 255 ;
end
496:
begin
Red = 255 ;
Green = 223 ;
Blue = 31 ;
end
497:
begin
Red = 255 ;
Green = 223 ;
Blue = 63 ;
end
498:
begin
Red = 255 ;
Green = 223 ;
Blue = 95 ;
end
499:
begin
Red = 255 ;
Green = 223 ;
Blue = 127 ;
end
500:
begin
Red = 255 ;
Green = 223 ;
Blue = 159 ;
end
501:
begin
Red = 255 ;
Green = 223 ;
Blue = 191 ;
end
502:
begin
Red = 255 ;
Green = 223 ;
Blue = 223 ;
end
503:
begin
Red = 255 ;
Green = 223 ;
Blue = 255 ;
end
504:
begin
Red = 255 ;
Green = 255 ;
Blue = 31 ;
end
505:
begin
Red = 255 ;
Green = 255 ;
Blue = 63 ;
end
506:
begin
Red = 255 ;
Green = 255 ;
Blue = 95 ;
end
507:
begin
Red = 255 ;
Green = 255 ;
Blue = 127 ;
end
508:
begin
Red = 255 ;
Green = 255 ;
Blue = 159 ;
end
509:
begin
Red = 255 ;
Green = 255 ;
Blue = 191 ;
end
510:
begin
Red = 255 ;
Green = 255 ;
Blue = 223 ;
end
511:
begin
Red = 255 ;
Green = 255 ;
Blue = 255 ;
end
				default:
					begin
						Red = 212;
						Green = 209;
						Blue = 255;
					end
			endcase
		end
endmodule		

