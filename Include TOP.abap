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