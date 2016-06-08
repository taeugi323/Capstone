def change_from_original(filename):
    fp1 = open(filename,"r")
    fp2 = open("after_"+filename,"w")

    fp2.write("file.open(\"imp.lua\",'w')\n")

    for i in fp1.read().split("\r\n"):
        fp2.write("file.writeline([["+i+"]])\n")

    fp2.write("file.close()")

    fp1.close()
    fp2.close()

change_from_original("imp.lua")
change_from_original("init.lua")
