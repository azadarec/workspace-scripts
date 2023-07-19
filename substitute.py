

f = open('steuerschlüssel.csv', 'r')
f_new = open('s.csv', 'w')

lines = f.readlines()

new_lines = []
for line in lines: 
    new_lines.append(line.replace(' ', ';', 1))

f_new.writelines(new_lines)

f.close()
f_new.close()