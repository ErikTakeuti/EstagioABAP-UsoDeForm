# EstagioABAP - USO DE FORMS

### PROGRAMA UTILIZANDO INCLUDE, FORM E PERFORM

```abap
REPORT zprog_008_02.

INCLUDE zprog_008_top.

*******************************************

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
PARAMETERS: p_ven  TYPE zvendas_02-venda,
            p_item TYPE zvendas_02-item,
            p_prod TYPE zvendas_02-produto,
            p_quan TYPE zvendas_02-quantidade,
            p_pre  TYPE zvendas_02-preco,
            p_uni  TYPE zvendas_02-unidade,
            p_moe  TYPE zvendas_02-moeda DEFAULT 'BRL',
            p_dat  TYPE zvendas_02-data DEFAULT sy-datum,
            p_hor  TYPE zvendas_02-hora DEFAULT sy-uzeit.

SELECTION-SCREEN END OF BLOCK a1.


SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002.
PARAMETERS: in  RADIOBUTTON GROUP rb DEFAULT 'X',
            alt RADIOBUTTON GROUP rb,
            del RADIOBUTTON GROUP rb.
SELECTION-SCREEN END OF BLOCK a2.

*******************************************

INCLUDE zprog_008_d01.

START-OF-SELECTION.

  PERFORM d_dados_tabela.

*******************************************VALIDAÇÃO DO PRODUTO

  PERFORM d_validacao_produto.

*******************************************FIM DA VALIDAÇÃO DO PRODUTO


*******************************************
  CASE 'X'.

    WHEN in. "INSERIR

      PERFORM d_dados_select.

      PERFORM d_validacao_estoque.

      PERFORM  d_inserir.

      PERFORM d_atualizacao_estoque.

    WHEN alt OR del.

      PERFORM d_dados_venda.

      PERFORM d_localizao_venda.

      PERFORM d_uptade.

  ENDCASE.

END-OF-SELECTION.
```
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### INCLUDE TOP

```abap
TABLES: zvendas_02,
        zestoque_02,
        zprodutos_02.

DATA: ls_produto TYPE zprodutos_e_02,
      lt_produto TYPE TABLE OF zprodutos_e_02,

      lt_est     TYPE TABLE OF zestoque_02,
      ls_est     LIKE LINE OF lt_est,

      lt_ven     TYPE TABLE OF zvendas_02,
      ls_ven     LIKE LINE OF lt_ven,
      ls_ven2    LIKE LINE OF lt_ven.
```
