def merge(arr):
# Caso base: se a lista tiver a ou 1 elemento,já está ordenada
    if len(arr) <=1:
        return arr
    # 1. Divide a lista ao meio
    mid = len(arr) // 2
    left = merge(arr[:mid])
    print(left)
    right = merge(arr[mid:])
    print(right)
    # 2. Mescla as duas sublistas usando
    sorted_arr = []
    i = 0
    j = 0
    while i < len(left) and j < len(right):
        if left[i]<=right[j]:
             sorted_arr.append(left[i])
             i +=1
        else:
             sorted_arr.append(right[j])
             j +=1
    sorted_arr.extend(left[i:])         
    sorted_arr.extend(right[j:])         
    return sorted_arr
# Exemplo de uso:
if __name__ == "__main__":
    numeros = [38, 27,10,10,23]
    print(merge(numeros)) 