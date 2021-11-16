function y = LogScale(x)

y_num = log(x-min(x)+1);
y_den = max(y_num);

y = y_num./y_den;

end