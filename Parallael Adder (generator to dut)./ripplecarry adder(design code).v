// Code your design here
// Code your design here
module fulladder(a,b,c,sum,carry);
  input a,b,c;
  output sum,carry;
  assign sum=a^b^c;
  assign carry=a&b|b&c|c&a;
endmodule
  
module paralleladder(
  input[3:0]a,
  input[3:0]b,
  input cin,
  output[3:0]s,
  output[3:0]c);
  fulladder u1(.a(a[0]),.b(b[0]),.c(cin),.sum(s[0]),.carry(c[0]));
  fulladder u2(.a(a[1]),.b(b[1]),.c(c[0]),.sum(s[1]),.carry(c[1]));
  fulladder u3(.a(a[2]),.b(b[2]),.c(c[1]),.sum(s[2]),.carry(c[2]));
  fulladder u4(.a(a[3]),.b(b[3]),.c(c[2]),.sum(s[3]),.carry(c[3]));
endmodule
