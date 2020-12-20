# Luisa Lima

	# Fa�a um algoritmo que gere e escreve na mem�ria de dados os n�meros �mpares entre 100 e 200.
	# Utilize O resto da divis�o para verificar se o n�mero � �mpar. 
	# Use o endere�o base de mem�ria 0x10010000 paraarmazenar os n�meros �mpares.
	
	## REGISTRADORES USADOS: 
	## $s0 - Armazenar endere�o de mem�ria inicial
	## $t1 - Controle do endere�o 
	## $t2 - i = 100
	## $t3 - condi��o de parada = 200
	## $t4 - valor = 2
	## $t5 - resto i%2
	
.data
	 .word 0 	# Valor inicial da mem�ria 0x10010000
	
.text
	ori $t2, $zero, 100	
	ori $t3, $zero, 200
	ori $t4, $zero, 2
	ori $t0, $zero, 0	# Valor em $t2 = 4
	lui $s0, 0x1001 	# $s0 vai ser o endere�o base de mem�ria
	
loop: 	beq $t2, $t3, Exit	# Se i = 200 sai do programa
	divu $t2, $t4		# Divide i por 2
	mfhi $t5		# Armazena resto em $t5
	beq $t5, $zero, par	# Desvia se n�mero for par
	sw $t2, 0($s0)		# Armazena n�mero �mpar na mem�ria
	addi $s0, $s0, 4	# Adiciona 4 no endere�o
	addi $t2, $t2, 1	# i + 1
	j loop
par: 
	addi $t2, $t2, 1	# i+1
	j loop
		
Exit: 
