from processMatrix import generateBoardValue

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
    return (size,listOfMines)

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


size,listOfMines=inputFromUser()
# print(size)
# print(listOfMines)
# for m in listOfMines:
#     print(m[0])
#     print(m[1])
#     print("=========")
board=generateBoardValue(size,listOfMines)
printBoard(size,board)
