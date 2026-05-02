REPORT ZMP03_ALV.

TABLES: likp, lips.

TYPES: BEGIN OF ty_likp,
         vbeln TYPE likp-vbeln,
         lfart TYPE likp-lfart,
         kunnr TYPE likp-kunnr,
         wadat TYPE likp-wadat_ist,
         vstel TYPE likp-vstel,
       END OF ty_likp.

TYPES: BEGIN OF ty_lips,
         vbeln TYPE lips-vbeln,
         posnr TYPE lips-posnr,
         matnr TYPE lips-matnr,
         lfimg TYPE lips-lfimg,
         meins TYPE lips-meins,
       END OF ty_lips.

DATA: it_likp TYPE TABLE OF ty_likp,
      it_lips TYPE TABLE OF ty_lips.

DATA: it_fcat TYPE slis_t_fieldcat_alv,
      it_fcat_lips TYPE slis_t_fieldcat_alv.

DATA: wa_fcat TYPE slis_fieldcat_alv,
      wa_fcat_lips TYPE slis_fieldcat_alv.

DATA: wa_layout TYPE slis_layout_alv.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE text-001.
SELECT-OPTIONS: s_vbeln FOR likp-vbeln.
SELECTION-SCREEN END OF BLOCK a1.

START-OF-SELECTION.

  SELECT vbeln lfart kunnr wadat_ist vstel
    FROM likp
    INTO TABLE it_likp
    WHERE vbeln IN s_vbeln.

  wa_layout-colwidth_optimize = 'X'.

*------------------ Field Catalog LIKP ------------------*
  wa_fcat-col_pos   = 1.
  wa_fcat-fieldname = 'VBELN'.
  wa_fcat-seltext_m = 'Delivery'.
  wa_fcat-hotspot   = 'X'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos   = 2.
  wa_fcat-fieldname = 'LFART'.
  wa_fcat-seltext_m = 'Delivery Type'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos   = 3.
  wa_fcat-fieldname = 'KUNNR'.
  wa_fcat-seltext_m = 'Customer'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos   = 4.
  wa_fcat-fieldname = 'WADAT'.
  wa_fcat-seltext_m = 'GI Date'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos   = 5.
  wa_fcat-fieldname = 'VSTEL'.
  wa_fcat-seltext_m = 'Shipping Point'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

*------------------ Display Header ALV ------------------*
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program      = sy-repid
      i_callback_user_command = 'USER'
      i_callback_top_of_page  = 'TOP'
      is_layout               = wa_layout
      it_fieldcat             = it_fcat
    TABLES
      t_outtab                = it_likp.

*---------------------------------------------------------------------*
FORM top.

  DATA: it_heading TYPE slis_t_listheader,
        wa_heading TYPE slis_listheader.

  wa_heading-typ  = 'H'.
  wa_heading-info = 'Delivery Header Report'.
  APPEND wa_heading TO it_heading.
  CLEAR wa_heading.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = it_heading.

ENDFORM.
*---------------------------------------------------------------------*
FORM user USING a TYPE sy-ucomm wa TYPE slis_selfield.

  IF wa-fieldname = 'VBELN'.

    CLEAR: it_lips, it_fcat_lips.

    SELECT vbeln posnr matnr lfimg meins
      FROM lips
      INTO TABLE it_lips
      WHERE vbeln = wa-value.

*------------------ Field Catalog LIPS ------------------*
    wa_fcat_lips-col_pos   = 1.
    wa_fcat_lips-fieldname = 'VBELN'.
    wa_fcat_lips-seltext_m = 'Delivery'.
    APPEND wa_fcat_lips TO it_fcat_lips.
    CLEAR wa_fcat_lips.

    wa_fcat_lips-col_pos   = 2.
    wa_fcat_lips-fieldname = 'POSNR'.
    wa_fcat_lips-seltext_m = 'Item'.
    APPEND wa_fcat_lips TO it_fcat_lips.
    CLEAR wa_fcat_lips.

    wa_fcat_lips-col_pos   = 3.
    wa_fcat_lips-fieldname = 'MATNR'.
    wa_fcat_lips-seltext_m = 'Material'.
    APPEND wa_fcat_lips TO it_fcat_lips.
    CLEAR wa_fcat_lips.

    wa_fcat_lips-col_pos   = 4.
    wa_fcat_lips-fieldname = 'LFIMG'.
    wa_fcat_lips-seltext_m = 'Quantity'.
    APPEND wa_fcat_lips TO it_fcat_lips.
    CLEAR wa_fcat_lips.

    wa_fcat_lips-col_pos   = 5.
    wa_fcat_lips-fieldname = 'MEINS'.
    wa_fcat_lips-seltext_m = 'Unit'.
    APPEND wa_fcat_lips TO it_fcat_lips.
    CLEAR wa_fcat_lips.

*------------------ Display Item ALV ------------------*
    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        i_callback_program = sy-repid
        is_layout          = wa_layout
        it_fieldcat        = it_fcat_lips
      TABLES
        t_outtab           = it_lips.

  ENDIF.

ENDFORM.
