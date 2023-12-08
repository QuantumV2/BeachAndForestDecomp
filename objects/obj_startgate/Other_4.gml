ini_open("saveData.ini")
global.pigtotal += ini_read_real("Highscore", string(level), 0)
ini_close()
