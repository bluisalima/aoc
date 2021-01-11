# Luisa Lima
# Escreva um programa que conte com tr�s subrotinas capazes de calcular a �rea da circunfer�ncia,
# �rea do tri�ngulo e �rea do ret�ngulo. Inicialmente, pergunte ao usu�rio qual forma geom�trica ele deseja
# (armazenando no registrador $t0) e depois solicite as medidas necess�rias para calcular a �rea de cada forma
# (armazenar para circunfer�ncia o valor r em $t0, tri�ngulo e ret�ngulo armazenarvalor de a e b em $t0 e $t1, respectivamente).
# Ao final, imprima a �rea desejada. Respeite as conven��es de uso dos registradores.

.data
	string: .asciiz "1 - Circunferencia\n2 - Triangulo\n3 - Retangulo\n"
	string2: .asciiz "Digite as medidas necessarias\n"
.text
.globl main

main:	ori $t3, 3		# Valor de pi = 3.14
	li $v0, 4		# Mostra o menu 
	la $a0, string			
	syscall
	
	li $v0, 5		# L� qual forma geometrica deseja calcular
	syscall
	addi $t0, $v0, 0	# Guarda o valor escolhido em $t0
	
	slti $t2, $t0, 2	# Testa se entrada � 1
	bne $t2, $0, circulo	# Se resultado � 1 pula pro circulo
	slti $t2, $t0, 3	# Testa se entrada � 2
	bne $t2, $0, triangulo	# Se resultado � 2 pula para triangulo
	li $v0, 4		# Pede os valores 
	la $a0, string2			
	syscall
	li $v0, 5		# L� o valor da base
	syscall
	addi $t0, $v0, 0	# Guarda o valor escolhido em $t0
	li $v0, 5		# L� o valor da altura
	syscall
	addi $t1, $v0, 0	# Guarda o valor escolhido em $t1
	jal ar
	j Exit
	
circulo: 
	li $v0, 4		# Pede os valores 
	la $a0, string2			
	syscall
	li $v0, 5		# L� o valor de raio
	syscall
	addi $t0, $v0, 0	# Guarda o valor escolhido em $t0
	jal ac
	j Exit
	
triangulo:
	li $v0, 4		# Pede os valores 
	la $a0, string2			
	syscall
	li $v0, 5		# L� o valor da base
	syscall
	addi $t0, $v0, 0	# Guarda o valor escolhido em $t0
	li $v0, 5		# L� o valor da altura
	syscall
	addi $t1, $v0, 0	# Guarda o valor escolhido em $t1
	jal at
	j Exit

ac: 	mult $t0, $t0		# Raio ao quadrado
	mflo $t4
	mult $t4, $t3		# Pi x Raio
	mflo $t5		# Armazena resultado em $t5
	jr $ra
	
at: 	mult $t0, $t1		# base x altura
	mflo $t4
	divu $t5, $t4, 2	# (base x altura)/2 e armazeza em $t5
	jr $ra

ar: 	mult $t0, $t1		# base x altura
	mflo $t5		# resultado em $t5
	
Exit:	li $v0, 1		# Imprime na tela o resultado
	la $a0, ($t5)
	syscall
	
	li $v0, 10		# Sai do programa
	syscall
