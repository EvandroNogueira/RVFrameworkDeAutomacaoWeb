Attribute VB_Name = "EXEMPLOS_USANDO_JAVASCRIPT"
Option Explicit


'Eu costumava a programar mais automa��es atraves do javascript / jquery das paginas do que
'utilizando os proprios elementos dentro do vba , pois era mais facil usar a janela de logs e dev
'dentro dos navegadores do que ir programando diretamente no vba,
'por exemplo , ao utilizar .ExecScript , era possivel usar comandos em Jquery ,
'se estou falando grego pra voc� , ignore provavelmente n�o � a hora de voc� saber disso!


'O mesmo exemplo no modulo exemplos_1 , s� que diferente , em comentario est� como foi feito
'sem o javascript , e como foi feito usando o javascript
Public Sub VaAoGooglePesquiseWikipedia_Apenas_Com_Javascripto()
    'O nome da sub ja diz o que o exemplo faz ! rsrsrs
    Dim ie As New ieRV
    With ie
        Call .iniciaIE
        Call .NAVEGAR("www.google.com.br")
        Call .waitElem("document.getElementsByName('q').item(0)", ".innerText = 'Wikipedia'", 20)
        'Call ie.getElement(20, "tagname", "input", "title", "pesquisar").setAttribute("innerText", "Wikipedia")
        Call .waitElem("document.getElementsByName('btnK').item(0)", ".click()", 20)
        'Call ie.getElement(20, "tagname", "input", "value", "*pesquisa*", "parentNode.tagname", "CENTER").Click
        Stop
    End With
End Sub


Public Sub AceitarUmAlerta()
    'LEIA OS COMENTARIOS ANTES DE DAR f5 Cabe�udo
    Dim ie As New ieRV
    With ie
        .iniciaIE noAddOns:=True
        Call .NAVEGAR("about:blank")
        'Essa linha lan�a um popup na janela do internet explorer
        'Call .execScript("setTimeout(""alert('ESSE � UM ERRO QUE O RONAN VICO CRIOU!');"", 1)")
        Call .ExecScriptAssync("alert('ESSE � UM ERRO QUE O RONAN VICO CRIOU!')", 1)
        Call .wait(1000)
        'Essa linha aceita o popup , lan�ando um erro com a mensagem que continha no popup.
        'Voc� pode tamb�m Mandar Falso e n�o receber o erro , apenas aceitando o alerta ex.: Call .aceitaAlerta(false)
        'S� sobe erro quando possuir o alerta , o erro � 12345 ,podendo ser tratado.
        Call .aceitaAlerta(True)
    End With
    Stop
End Sub
