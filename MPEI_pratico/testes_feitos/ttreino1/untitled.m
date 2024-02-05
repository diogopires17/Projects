n = ceil(m / (-k / log(1 - exp(log(p) / k))));
p = (1 - exp(-k * m / n)) ^ k;
m = round(-(n * log(p)) / ((k)*log(2)));
k = round((m/n) * log(2));