def vertical(n):
    if(n <= 9):
        print(n)
    else:
        vertical(n//10)
        print(n%10)


n = int(input("Digite um número: "))
print(vertical(n))