from subprocess import Popen, PIPE

# TODO: Comment the below line for submission, and uncomment the next line
#process = Popen(["./cfish_nocounter"], stdin=PIPE, stdout=PIPE, text=True)
process = Popen(["/kaggle_simulations/agent/cfish"], stdin=PIPE, stdout=PIPE, text=True)
move = 0

# 1000 ms in 1 second
# 10,000 ms in 10 seconds

# 
def cfish(obs):
    move += 1
    process.stdin.write(f"position fen {obs.board}\n")
    if move <= 30:
        process.stdin.write("go movetime 300\n")
    else:
        process.stdin.write("go movetime 100\n")
    process.stdin.flush()
    while True:
        line = process.stdout.readline().strip().split()
        if line and line[0] == "bestmove":
            return line[1]
