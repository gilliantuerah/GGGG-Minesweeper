from processMatrix import *
from clips import Environment,Symbol
# import clips

def inputFromUser():
    '''
    Fungsi untuk melakukan input melalui cmd dan mengembalikannya
    Dengan format
    - size board
    - banyaknya mines
    - koordinat mines
    '''
    # init listOfMines yaitu array of tuple koordinat masukan
    listOfMines=[]
    # masukan ukuran board
    size=int(input("Masukkan ukuran board: "))
    # masukan jumlah mines
    n=int(input("Masukkan banyaknya mines atau ranjau: "))
    print("Masukkan koordinat mines: ")
    for i in range(n):
        # masukan sebuah koordinat
        x,y=[int(x) for x in input().split(', ')]
        koordinat=(x,y)
        # koordinat masukan di append ke list
        listOfMines.append(koordinat)

    # mengembalikan semua masukan yang diperoleh
    return (size,listOfMines,n)

def printBoard(size,board):
    '''
    Prosedur mencetak full board dengan value
    '''
    for i in range (size):
        for j in range (size):
            if j==size-1:
                print(board[i][j])
            else:
                print(board[i][j],end=" ")

if __name__ == "__main__":
    size,listOfMines,n=inputFromUser()
    board=generateBoardValue(size,listOfMines)
    printBoard(size,board)
    # load clips
    env = Environment()
    env.load('minesweeper.clp')
    # add facts jumlah mines
    insertFactsMine=addFactsSizeMines(n)
    env.assert_string(insertFactsMine)
    # add facts size board
    insertFactsSize=addFactsSizeBoard(size)
    env.assert_string(insertFactsSize)
    # add facts mines coord 
    for m in listOfMines:
        koordx=m[0]
        koordy=m[1]
        insertFactsMinesKoord=addOneFactsKoordMines(koordx,koordy)
        env.assert_string(insertFactsMinesKoord)
    # add facts to clips
    for i in range (size):
        for j in range (size):
            insertFacts=addOneFactsToClips(board[i][j],i,j)
            # print(insertFacts)
            env.assert_string(insertFacts)
            

    # facts
    # for fact in env.facts():
    #     print(fact)
    # run clips
    env.run()

    # facts
    for fact in env.templates():
        print(fact)
    
    # print(env.strategy)
        
