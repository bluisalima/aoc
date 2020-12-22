# Luisa Lima

	# Escreva uma subrotina que retorne a m�dia entre tr�s valores.  
	# A subrotina deve receber comoargumentos tr�s inteiros e retornar a m�dia entre eles. 
	# Escreva um programa principal respons�vel por ler tr�s valores informados pelo usu�rio e imprima o resultado.
	# Importante: Utilize os registradores convencionadospara a passagem de argumentos e valor de retorno!
	# Armazene o retorno da subrotina (m�dia entre os tr�s valores)no registrador $t5.
	
	# Registradores usados: 
	# $t1 - Primeiro n�mero
	# $t2 - Segundo n�mero
	# $t3 - Terceiro n�mero 
	# $t4 - Soma dos n�meros
	# $t5 - Resultado da m�dia
	
.data	
		
.text
	.globl main

main:	li $v0, 5		# L� primeiro n�mero da entrada
	syscall
	jal media		# Copia valor da entrada para registrador $t1
	
	li $v0, 5		# L� segundo n�mero da entrada
	syscall
	jal media		# Copia valor da entrada para registrador $t2
	
	li $v0, 5		# L� segundo n�mero da entrada
	syscall
	jal media		# Copia valor da entrada para registrador $t3
	
	li $v0, 1		# Imprime na tela a m�dia dos numeros ($t5)
	la $a0, ($t5)
	syscall
	
	li $v0, 10		# Sai do programa
	syscall
	
media:	add $t4, $t4, $v0	# Armazena valor da soma dos n�meros
	divu $t5,$t4, 3		# Calcula a m�dia
	jr $ra			# Volta para onde parou no programa principal
	
	