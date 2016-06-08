def change_to_original(filename):
    fp1 = open("after_"+filename,'r')
    fp2 = open(filename,'w')

    fp1.readline()

    for i in fp1.read().split('\n'):
        if 'file.writeline' in i:
            i = i.replace('file.writeline([[','')
            i = i.replace(']])','')
            
            fp2.write(i+'\n')

    fp1.close()
    fp2.close()

change_to_original("imp.lua")
change_to_original("init.lua")
