REPORT  Z104329PGM8.
*A DDIC Table and Structure can
*also be included in a field string
DATA: BEGIN OF FLIGHTINFO.
        INCLUDE STRUCTURE SCARR.
DATA: CONNID    TYPE SPFLI-CONNID,
      COUNTRYFR TYPE SPFLI-COUNTRYFR,
      CITYFROM  TYPE SPFLI-CITYFROM,
END OF FLIGHTINFO.


SELECT SC~MANDT SC~CARRID SC~CARRNAME SC~CURRCODE SC~URL
   SP~CONNID SP~COUNTRYFR SP~CITYFROM
   INTO  FLIGHTINFO
  FROM SCARR AS SC
  INNER JOIN
  SPFLI AS SP
  ON SC~CARRID = SP~CARRID.
  WRITE: /  FLIGHTINFO-MANDT,
      FLIGHTINFO-CARRID,
      FLIGHTINFO-CARRNAME,
      FLIGHTINFO-CURRCODE,
      FLIGHTINFO-URL,
      FLIGHTINFO-CONNID,
      FLIGHTINFO-COUNTRYFR,
      FLIGHTINFO-CITYFROM.
ENDSELECT.