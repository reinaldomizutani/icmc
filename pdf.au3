Global $parar=0, $clipboard, $inicial, $final, $gmail

;--------------------------------------------------------------
; FUNÇÕES
;--------------------------------------------------------------
Func removeCharEspeciais($inicial); função para remover caracteres especiais.

	$inicial = StringLeft($clipboard, 50)

	$inicial = StringReplace($inicial, "-", "_"); pontos e sinalizações
	$inicial = StringReplace($inicial, " ", "_")
	$inicial = StringReplace($inicial, ";", "_")
	$inicial = StringReplace($inicial, ":", "_")
	$inicial = StringReplace($inicial, "/", "_")
	$inicial = StringReplace($inicial, "\", "_")
	$inicial = StringReplace($inicial, "{", "_")
	$inicial = StringReplace($inicial, "}", "_")
	$inicial = StringReplace($inicial, "[", "_")
	$inicial = StringReplace($inicial, "]", "_")
	$inicial = StringReplace($inicial, "(", "_")
	$inicial = StringReplace($inicial, ")", "_")
	$inicial = StringReplace($inicial, "?", "_")
	$inicial = StringReplace($inicial, "!", "_")
	$inicial = StringReplace($inicial, "~", "_")
	$inicial = StringReplace($inicial, "^", "_")
	$inicial = StringReplace($inicial, "|", "_")
	$inicial = StringReplace($inicial, "´", "_")
	$inicial = StringReplace($inicial, "<", "_")
	$inicial = StringReplace($inicial, ">", "_")
	$inicial = StringReplace($inicial, "#", "_")
	$inicial = StringReplace($inicial, "$", "_")
	$inicial = StringReplace($inicial, "'", "_")
	$inicial = StringReplace($inicial, '"', "_")
	$inicial = StringReplace($inicial, "ã", "a"); acentos
	$inicial = StringReplace($inicial, "á", "a")
	$inicial = StringReplace($inicial, "â", "a")
	$inicial = StringReplace($inicial, "à", "a")
	$inicial = StringReplace($inicial, "Â", "A")
	$inicial = StringReplace($inicial, "Ã", "A")
	$inicial = StringReplace($inicial, "Á", "A")
	$inicial = StringReplace($inicial, "À", "A")
	$inicial = StringReplace($inicial, "é", "e")
	$inicial = StringReplace($inicial, "ê", "e")
	$inicial = StringReplace($inicial, "É", "E")
	$inicial = StringReplace($inicial, "Ê", "E")
	$inicial = StringReplace($inicial, "í", "i")
	$inicial = StringReplace($inicial, "Ì", "I")
	$inicial = StringReplace($inicial, "ó", "o")
	$inicial = StringReplace($inicial, "õ", "o")
	$inicial = StringReplace($inicial, "ô", "o")
	$inicial = StringReplace($inicial, "Ó", "O")
	$inicial = StringReplace($inicial, "Õ", "O")
	$inicial = StringReplace($inicial, "Ô", "O")
	$inicial = StringReplace($inicial, "ú", "u")
	$inicial = StringReplace($inicial, "ù", "u")
	$inicial = StringReplace($inicial, "ú", "u")
	$inicial = StringReplace($inicial, "Ù", "u")
	Return $inicial
EndFunc

;--------------------------------------------------------------
; inicio do programa
;--------------------------------------------------------------
sleep(2000)
; verificando se a janela ativa é a do gmail
$gmail = WinGetTitle("[ACTIVE]")
$parar = StringInStr($gmail, "E-mail de Universidade de São Paulo") ; se encontrar "E-mail de Universidade de São Paulo" na string, $parar recebe algum int != 0
;ConsoleWrite("parar = " & $parar & @lf& @lf& @lf& @lf& @lf) ;print para debug

send("{F6}"); seleciona a URL
sleep(400)
send("^c")  ; copia URL
$URL = ClipGet(); $URL recebe o valor do clipboard
ConsoleWrite($URL) ; print pra debug
send("^p"); abre janela para impressão (padrão é salvar como PDF)
sleep(1000)
send("{ENTER}"); aceita imprimir
sleep(1000)
send("^c"); copia o nome do arquivo sugerido pelo site
sleep(500)

sleep(500)
send("{ENTER}"); aceita salvar o arquivo com o nome
sleep(500)
send("^w"); fecha a aba


#comments-start

; iteração entre as abas do Chrome até ele encontrar a aba do Gmail
While $parar = 0
	send("{F6}")
	$URL = ClipGet()
	ConsoleWrite($URL)
	send("^p")
	sleep(1000)
	send("{ENTER}")
	sleep(1000)
	send("^x")
	sleep(500)

	$clipboard = ClipGet()


	;--------------------------------------------------------------
	; seleciona o campo de URL, copia e
	;--------------------------------------------------------------

	send("^w")

	; bloco para interromper o while inicial
	$gmail = WinGetTitle("[ACTIVE]")
	$parar = StringInStr($gmail, "E-mail de Universidade de São Paulo")


WEnd


;$a_file[$x] = StringReplace($a_file[$x],":",";")




; parser para encontrar o nome do veiculo (baseado na URL)


;For $i = 1 To 10
;	ConsoleWrite($inicial[$i])
;Next



#comments-end

