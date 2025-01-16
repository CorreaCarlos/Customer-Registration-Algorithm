programa
{
	inclua biblioteca Util
 --> U
 	const inteiro total = 200                     // limite de registros
 	cadeia nome[total], cabecalho_funcao          // vetor para o nome, titulo cabeçalho tela
	inteiro  quant, registro = 0, idade[total]    // variavel registro = posição vetor, vetor para a idade
	caracter opcao
	
	funcao inicio()
	{
		limpa()  // limpa tela
		menu()  // Chama função menu
	}

	funcao menu()
	{
		cabecalho_funcao = "             MENU GERAL                "
		cabecalho()

		escreva("1 - Cadastro de Clientes \n")
		U.aguarde(175)  //animação menu
		escreva("2 - Lista de Clientes Cadastrados \n")
		U.aguarde(175)  //animação menu
		escreva("3 - Buscar Cliente \n")
		U.aguarde(175)  //animação menu
		escreva("4 - Excluir cadastro de cliente \n")
		U.aguarde(175)  //animação menu
		escreva("5 - Sair \n")
		U.aguarde(175)  //animação menu

		escreva("---------------------------------------- \n")
		U.aguarde(200)  //animação menu
		escreva("Informe a opção desejada: \n")
		leia(opcao)

		escolha(opcao)
		{
			caso '1':
			{
				cadastro()
				pare
			}
			caso '2':
			{
				listar()
				pare
			}
			caso '3':
			{
				buscar()
				pare
			}
			caso '4':
			{
				exclui()
				pare
			}
			caso '5':
			{
				sair()
				pare
			}
			caso contrario:  // Caso escolha opção diferente mostra mensagem de erro e chama função menu denovo
			{
				escreva("Opção inválida! \n")
				U.aguarde(3000)
				menu()
				pare
			}
		}
	}

	funcao cadastro()
	{
		cabecalho_funcao = "         CADASTRO DE CLIENTES           "
		cabecalho()
		se((total-registro > 0)) //total de posições - registro = registros disponiveis, se for maior que zero então há espaço para cadastrar mais clientes!
		{
			cabecalho_funcao = "         CADASTRO DE CLIENTES           "
			cabecalho()
			escreva("Quantos clientes gostaria de cadastrar?\n")
			leia(quant)
		
			se(quant > 0 e quant <= (total - registro)) // se a quant de clientes a cadastrar for ao menos 1 e igual ou menor a quant de registros disponiveis
			{
				inteiro contador = 0 // para executar o cadastro de acordo com quantas pessoas o usuario quer cadastrar
				enquanto(contador < quant)
				{
					cabecalho_funcao = "         CADASTRO DE CLIENTES           "
					cabecalho()
					escreva("Informe o nome do(a) cliente: \n")
					leia(nome[registro])
				

					cabecalho_funcao = "         CADASTRO DE CLIENTES           "
					cabecalho()
					escreva("Informe a idade do(a) ", nome[registro], ": \n")
					leia(idade[registro])

					cabecalho_funcao = "         CADASTRO DE CLIENTES           "
					cabecalho()
					escreva("Cadastro Realizado com Sucesso! \n")
					U.aguarde(2000)   // aguarda 2 sec
					contador ++
					registro ++
				}
			}
			senao se(quant == 0)
			{
				cabecalho_funcao = "         CADASTRO DE CLIENTES           "
				cabecalho()
				escreva("A quantidade inserida é igual a zero!!")
			}
			senao se(quant > (total-registro))
			{
				cabecalho_funcao = "         CADASTRO DE CLIENTES           "
				cabecalho()
				escreva("A quantidade inserida excede a quantidade de registros disponiveis!\nRegistros disponiveis: ", (total-registro),"\n")
			}
			senao // mensagem de erro e volta para o menu
			{
			cabecalho_funcao = "         CADASTRO DE CLIENTES           "
			cabecalho()
			escreva("Atenção: Opção inválida! Tente novamente!\n")
			}
		
		}
		senao
		{
			escreva("O sistema atingiu o limite de cadastros!!")
		}
		U.aguarde(1000)
		retorna()
	}

	funcao sair()
	{
		limpa()
		escreva("Finalizando o sistema em 03 segundos. . .")
		U.aguarde(1000) //animação contagem regressiva para fechar sistema

		limpa()
		escreva("Finalizando o sistema em 02 segundos. . .")
		U.aguarde(1000) //animação contagem regressiva para fechar sistema

		limpa()
		escreva("Finalizando o sistema em 01 segundos. . .")
		U.aguarde(1000) //animação contagem regressiva para fechar sistema
	}

	funcao listar()
	
	{
		cabecalho_funcao = "     LISTA DE CLIENTES CADASTRADOS     "
		cabecalho()
		se(registro == 0) // se a variavel é igual a vazio, significa que nenhum cliente foi cadastrado ainda
		{
			escreva("Nenhum cliente cadastrado sistema.\n")
		}
		senao // exibe todos os clientes cadastrados e retorna ao menu
		{
			escreva(" Lista de Clientes Cadastrados \n\n")
			para(inteiro i = 0;i < registro; i++)
				{
					escreva((i+1) + ". " + nome[i] + " - " + idade[i] + "\n")
				}
		}
		U.aguarde(1000)
		retorna()
	}

	funcao buscar()
	{
		logico encontrado = falso
		cadeia busca
		cabecalho_funcao = "       PESQUISA CLIENTE CADASTRADO         "
		cabecalho()
		se(registro == 0) // se a variavel é igual a vazio, significa que nenhum cliente foi cadastrado ainda
		{
			escreva("Nenhum cliente cadastrado no sistema.\n")
		}
		senao
		{
			escreva("Informe o nome do cliente que você busca: ")
			leia(busca)
			escreva("\n")
			para(inteiro i=0;i<registro;i++)
			{
				se(nome[i] == busca)
				{
				escreva((i+1) + ". " + nome[i] + " - " + idade[i] + "\n")
				encontrado = verdadeiro
				U.aguarde(100)
				}
			}
			se(encontrado == falso)
			{
				escreva("Cliente não escontrado\n")
			}
		}
		U.aguarde(1000)
		retorna()
	}

	funcao retorna()
	{
		cadeia enter
		escreva("\n"+"Aperte [ENTER] para sair.")
		leia(enter)
		menu()
	}

	funcao cabecalho()
	{
		limpa()
		escreva("========================================= \n")
		U.aguarde(50)  //animação menu
		escreva("|" + cabecalho_funcao + "|\n")
		U.aguarde(50)  //animação menu
		escreva("========================================= \n\n")
		U.aguarde(50)  //animação menu
	}

	funcao exclui()
	{
		cabecalho_funcao = "           Excluir Cadastro            "
		cabecalho()
		logico encontrado = falso
		cadeia busca, confirma
		se(registro == 0) // se a variavel é igual a vazio, significa que nenhum cliente foi cadastrado ainda
		{
			escreva("Nenhum cliente cadastrado no sistema.\n")
		}
		senao
		{
			escreva("Informe o cliente que deseja excluir o cadastro:\n")
			leia(busca)
			limpa()
			para(inteiro i=0;i<registro;i++)
			{
				se(nome[i] == busca)
				{
					escreva((i+1) + ". " + nome[i] + " - " + idade[i] + "\n")
					encontrado = verdadeiro
					escreva("Você confirma a exclusão do cadastro deste cliente?[S/N]: ")
					leia(confirma)
					se(confirma == "S" ou confirma == "s")
					{
						para(inteiro x = i; x < registro-1; x++)
						{
						nome[x] = nome[x+1]
						idade[x] = idade[x+1]
						}
						registro--
						limpa()
						escreva("\nUsuário excluido com sucesso!\n")
					}
					senao se(confirma == "N" ou confirma == "n")
					{
						U.aguarde(100)
						limpa()
						escreva("\nOperação Cancelada!\n")
					}
					senao
					{
						U.aguarde(100)
						escreva("\nOpção Inválida! Tente Novamente!\n")
					}
				}
			}
			se(encontrado == falso)
			{
				escreva("Cliente não escontrado\n")
			}
		}
		U.aguarde(200)
		retorna()
		
	}
	
}
