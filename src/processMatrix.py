def generateBoardValue(size,listOfMines):
    '''
    Fungsi untuk mengembalikan board matriks yang sudah berisikan nilai
    sesuai masukan koordinat mine dari user
    '''
    # init matrix size x size
    board=[[0 for i in range(size)] for j in range(size)]

    '''
    VALUE MATRIX
    mine ditandai dengan 'm'
    sisanya ditandai dengan 0,1,2,3,4
    '''

    # loop untuk semua koordinat yang ada di listOfMine
    for m in listOfMines:
        koordx=m[0]
        koordy=m[1]
        # mengisi value 'm' untuk koordinat
        board[koordx][koordy]='m'
        
        # untuk value 8 box di sekitarnya ditambahkan 1
        x=[koordx+1,koordx-1,koordx,koordx,koordx-1,koordx+1,koordx-1,koordx+1]
        y=[koordy,koordy,koordy+1,koordy-1,koordy+1,koordy+1,koordy-1,koordy-1]
        for i in range(8):
            if(x[i]>=0)and(y[i]>=0)and(x[i]<size)and(y[i]<size)and(board[x[i]][y[i]]!='m'):
                # jika koordinat valid
                board[x[i]][y[i]]+=1
    
    
    return board

def addOneFactsToClips(value,x,y,):
    fact_string = "(boxValuePython(x "+str(x)+")(y "+str(y)+")(value "+str(value)+"))"
    return fact_string


def addFactsSizeMines(n):
    fact_string="(banyakMinesPython(n "+str(n)+"))"
    return fact_string

def addOneFactsKoordMines(x,y):
    fact_string="(minesKoordpython(x "+str(x)+")(y "+str(y)+"))"
    return fact_string

def addFactsSizeBoard(n):
    fact_string="(sizeBoardPython(n "+str(n-1)+"))"
    return fact_string