matrix = [
    ['9', '5', '3'],
    ['0', '7', '-1'],
    ['-5', '2', '9'],
    "end"
]

result_matrix = []
i_idx = 0
j_idx = -len(matrix[0])


for i in matrix:
    if (i == "end"):
        break

    j_place = -len(i) + 1
    i_place = -len(i) + 1
    n = 0
    for j in i:
        n = int(i[j_place+1]) + int(i[j_place+2]) + int(matrix[i_idx][i_place]) + int(matrix[i_idx][i_place+1])
        j_place += 1
        print(n)
    i_idx += 1
