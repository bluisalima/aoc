# Lu�sa Lima

	# Fa�a um programa em assembly que conte de 1 at� 10 e verifique a quantidade de 
	# n�meros �mparese pares. Calcule tamb�m a soma dos n�meros pares armazenando o 
	# resultado no registrador ($t6) e a m�dia dosn�meros �mpares armazenando o resultado no registrador ($t7).

	## REGISTRADORES USADOS: 
	## $t0 - Quantidade de n�meros pares 
	## $t1 - Quantidade de n�meros �mpares
	## $t2 - Auxiliar [i]
	## $t3 - Condi��o de parada (valor = 10)
	## $t4 - valor 2
	## $t6 - Soma dos n�meros pares
	## $t7 - M�dia dos n�meros �mpares 

.text
	ori $t2, $zero, 0 	# Inicia i = 0
	ori $t3, $zero, 11	# Valor = 10 
	ori $t4, $zero, 2	# Valor = 2
	
loop:	beq $t2, $t3, Exit	# Se i = 10 pula para sa�da
	divu $t2, $t4		# Divide i por 2 | i / 2
	mfhi $t5		# Resto da divis�o armazenado em $t5
	bne $t5, $zero, impar	# Desvia se for �mpar
	addi $t0, $t0, 1	# Adiciona +1 na quantidade de n�meros pares
	add $t6, $t6, $t2	# Somador para n�meros pares
	addi $t2, $t2, 1	# i = i+1 
	j loop
	
impar: 
	addi $t1, $t1, 1	# Adiciona +1 na quantidade de n�meros �mpares
	add $t8, $t8, $t2	# Soma valores dos n�meros �mpares
	addi $t2, $t2, 1	# i = i+1
	divu $t8, $t1		# Calcula a m�dia dos valores �mpares
	mflo $t7		# Armazena m�dia no registrador $t7
	j loop
Exit: 
