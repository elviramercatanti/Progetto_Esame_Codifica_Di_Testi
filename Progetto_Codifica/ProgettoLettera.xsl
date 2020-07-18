<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:tei="http://www.tei-c.org/ns/1.0"
        xmlns="http://www.w3.org/1999/xhtml">

        <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
       

        <!--creare lo scheletro del documento finale HTML-->
        <xsl:template match="/">

            <html>

                <head>
                    <script src="Progetto.js"></script>

                    <link href="Progetto.css" rel="stylesheet" type="text/css"/>
                    <link href="https://fonts.googleapis.com/css?family=Charm" rel="stylesheet"/>

                    <!--titolo che compare nella scheda di navigazione-->
                    <title>Vincenzo Bellini</title>

                    <!--icona scheda di navigazone-->
                    <link rel="icon" href="stilografica.png" type="image/x-icon"/>
                </head>



                <body>

                    <div><!--creo la freccia per muovermi all'interno della pagina-->
                        
                        <a href="#InfoProgetto" title="vai alla fine">
                            <div class="freccia" id="frecciagiu"></div>
                        </a>

                        <a href="#titolo" title="torna all'inizio">
                            <div class="freccia" id="frecciasu"></div>
                        </a>
                        
                    </div>


                    <header><!--creo un header con il titolo della pagina-->
                        <span id="titolo"><xsl:apply-templates select="//tei:teiHeader//tei:titleStmt//tei:title"/></span>
                    </header>

                    
                    <div id="InfoPrincipali" class="container">
                        <div class="colrow">

                            <!--riporto mittente, destinatario, luogo, data e lingua-->
                            <div id="InfoLettera" class="stylebox">
                                <xsl:apply-templates select="//tei:profileDesc"/>
                                <xsl:apply-templates select = "//tei:back//tei:note"/>     
                            </div>

                            <!--riporto la segnatura e il luogo in cui si trova la lettera-->
                            <div id="collocazione" class="stylebox">
                                <xsl:apply-templates select="//tei:msDesc"/>
                            </div>

                        </div>
                    </div>
                    
                    <div id="corpo" class="container">
                        <div class="colrow">

                            <div>

                                <!--freccia per scorrere le lettere a sinistra-->
                                <div class="freccia" id="frecciaindietro"></div>

                                <!--div immagine pagine-->
                                <div id="imgLettera">
                                
                                    <!--img fronte recto-->
                                    <div id="folio1" style="display:none">
                                        <img src = "LL1.12_0001.png" id = "f1" class="folio"/>

                                        <xsl:for-each select = "//tei:surface[@n='1']//tei:zone">
                                            
                                            <xsl:variable name = "width">
                                                <xsl:value-of select = "translate(..//tei:graphic/@width,'px','')"/>
                                            </xsl:variable>

                                            <xsl:variable name = "height">
                                                <xsl:value-of select = "translate(..//tei:graphic/@height,'px','')"/>
                                            </xsl:variable>

                                            <xsl:variable name = "ulx">
                                                <xsl:value-of select = "@ulx"/>
                                            </xsl:variable>

                                            <xsl:variable name = "uly">
                                                <xsl:value-of select = "@uly"/>
                                            </xsl:variable>
                                            
                                            <xsl:variable name = "lrx">
                                                <xsl:value-of select = "@lrx"/>
                                            </xsl:variable>

                                            <xsl:variable name = "lry">
                                                <xsl:value-of select = "@lry"/>
                                            </xsl:variable>
                                            
                                            <a class = "arealb">

                                                <xsl:attribute name = "facs">
                                                    <xsl:value-of select = "@xml:id"/>
                                                </xsl:attribute>
                                              
                                                <xsl:attribute name="style">

                                                    position:absolute;
                                                    left:<xsl:value-of select ="$ulx * 100 div $width"/>%;
                                                    top:<xsl:value-of select ="$uly * 100 div $height"/>%;
                                                    width:<xsl:value-of select = "($lrx - $ulx) * 100 div $width"/>%;
                                                    height:<xsl:value-of select = "($lry - $uly) * 100 div $height"/>%;

                                                </xsl:attribute>
                                            </a>
                                        </xsl:for-each>
                            
                                        
                                    </div>


                                    <!--img fronte verso-->
                                    <div id="folio2" style="display:none">
                                        <img src = "LL1.12_0002.png" id = "f2" class="folio"/>
                                        <xsl:for-each select = "//tei:surface[@n='2']//tei:zone">
                                            
                                            <xsl:variable name = "width">
                                                <xsl:value-of select = "translate(..//tei:graphic/@width,'px','')"/>
                                            </xsl:variable>

                                            <xsl:variable name = "height">
                                                <xsl:value-of select = "translate(..//tei:graphic/@height,'px','')"/>
                                            </xsl:variable>

                                            <xsl:variable name = "ulx">
                                                <xsl:value-of select = "@ulx"/>
                                            </xsl:variable>

                                            <xsl:variable name = "uly">
                                                <xsl:value-of select = "@uly"/>
                                            </xsl:variable>
                                            
                                            <xsl:variable name = "lrx">
                                                <xsl:value-of select = "@lrx"/>
                                            </xsl:variable>

                                            <xsl:variable name = "lry">
                                                <xsl:value-of select = "@lry"/>
                                            </xsl:variable>
                                            
                                            <a class = "arealb">

                                                <xsl:attribute name = "facs">
                                                    <xsl:value-of select = "@xml:id"/>
                                                </xsl:attribute>

                                                <xsl:attribute name="style">

                                                    position:absolute;
                                                    left:<xsl:value-of select ="$ulx * 100 div $width"/>%;
                                                    top:<xsl:value-of select ="$uly * 100 div $height"/>%;
                                                    width:<xsl:value-of select = "($lrx - $ulx) * 100 div $width"/>%;
                                                    height:<xsl:value-of select = "($lry - $uly) * 100 div $height"/>%;

                                                </xsl:attribute>
                                            </a>
                                        </xsl:for-each>
                                    </div>


                                    <!--img retro recto-->
                                    <div id="folio3" style="display:none">
                                        <img src = "LL1.12_0003.png" id = "f3" class="folio"/>
                                        <xsl:for-each select = "//tei:surface[@n='3']//tei:zone">
                                            
                                            <xsl:variable name = "width">
                                                <xsl:value-of select = "translate(..//tei:graphic/@width,'px','')"/>
                                            </xsl:variable>

                                            <xsl:variable name = "height">
                                                <xsl:value-of select = "translate(..//tei:graphic/@height,'px','')"/>
                                            </xsl:variable>

                                            <xsl:variable name = "ulx">
                                                <xsl:value-of select = "@ulx"/>
                                            </xsl:variable>

                                            <xsl:variable name = "uly">
                                                <xsl:value-of select = "@uly"/>
                                            </xsl:variable>
                                            
                                            <xsl:variable name = "lrx">
                                                <xsl:value-of select = "@lrx"/>
                                            </xsl:variable>

                                            <xsl:variable name = "lry">
                                                <xsl:value-of select = "@lry"/>
                                            </xsl:variable>
                                            
                                            <a class = "arealb">

                                                <xsl:attribute name = "facs">
                                                    <xsl:value-of select = "@xml:id"/>
                                                </xsl:attribute>

                                                <xsl:attribute name="style">

                                                    position:absolute;
                                                    left:<xsl:value-of select ="$ulx * 100 div $width"/>%;
                                                    top:<xsl:value-of select ="$uly * 100 div $height"/>%;
                                                    width:<xsl:value-of select = "($lrx - $ulx) * 100 div $width"/>%;
                                                    height:<xsl:value-of select = "($lry - $uly) * 100 div $height"/>%;

                                                </xsl:attribute>
                                            </a>
                                        </xsl:for-each>
                                    </div>


                                    <!--img retro verso-->
                                    <div id="folio4" style="display:none">
                                        <img src = "LL1.12_0004.png" id = "f4" class="folio" />
                                        <xsl:for-each select = "//tei:surface[@n='4']//tei:zone">
                                            
                                            <xsl:variable name = "width">
                                                <xsl:value-of select = "translate(..//tei:graphic/@width,'px','')"/>
                                            </xsl:variable>

                                            <xsl:variable name = "height">
                                                <xsl:value-of select = "translate(..//tei:graphic/@height,'px','')"/>
                                            </xsl:variable>

                                            <xsl:variable name = "ulx">
                                                <xsl:value-of select = "@ulx"/>
                                            </xsl:variable>

                                            <xsl:variable name = "uly">
                                                <xsl:value-of select = "@uly"/>
                                            </xsl:variable>
                                            
                                            <xsl:variable name = "lrx">
                                                <xsl:value-of select = "@lrx"/>
                                            </xsl:variable>

                                            <xsl:variable name = "lry">
                                                <xsl:value-of select = "@lry"/>
                                            </xsl:variable>
                                            
                                            <a class = "arealb">

                                                <xsl:attribute name = "facs">
                                                    #<xsl:value-of select = "@xml:id"/>
                                                </xsl:attribute>

                                                <xsl:attribute name="style">

                                                    position:absolute;
                                                    left:<xsl:value-of select ="$ulx * 100 div $width"/>%;
                                                    top:<xsl:value-of select ="$uly * 100 div $height"/>%;
                                                    width:<xsl:value-of select = "($lrx - $ulx) * 100 div $width"/>%;
                                                    height:<xsl:value-of select = "($lry - $uly) * 100 div $height"/>%;

                                                </xsl:attribute>
                                            </a>
                                        </xsl:for-each>
                                    </div>

                                </div>

                                <!--freccia per scorrere le lettere a destra-->
                                <div class="freccia" id="frecciaavanti"></div>

                            </div>
                            
                            <div id="testoLettera" class="stylebox">
                                <h3 class="TitoliInTestoLettera">Testo lettera</h3>
                                <xsl:apply-templates select = "//tei:div[@type = 'fronte-recto']"/>
                                <xsl:apply-templates select = "//tei:div[@type = 'retro-recto']"/>
                                <xsl:apply-templates select = "//tei:div[@type = 'retro-verso']"/>
                                <xsl:apply-templates select = "//tei:div[@type = 'fronte-verso']"/>


                                <div id="legendacolori">
                                    <br/>
                                    <p class="TitoliInTestoLettera">Legenda colori:
                                    <span class="person"> Persone </span>
                                    <span class="place"> Luoghi </span></p>
                                </div>

                            </div>

                        </div>
                    </div>

                    
                    <!--Info Secondarie-->
                    <div id="InfoSecondarie" class="container">
                        <div class="colrow">

                            <div id="legenda" class="stylebox">
                                <xsl:apply-templates select= "//tei:listPerson"/>
                                <xsl:apply-templates select = "//tei:listPlace"/>
                                                
                            </div>
                            
                            <div id="caratteristicheLettera" class="stylebox">
                                <xsl:apply-templates select = "//tei:physDesc"/>
                            </div>

                        </div>
                    </div>

                    
                    
                    <div id="InfoProgetto" class="container">
                        <div class="stylebox">
                            <h3>Informazioni sul progetto</h3>
                            <xsl:apply-templates select = "//tei:titleStmt//tei:respStmt"/>
                            <xsl:apply-templates select = "//tei:editionStmt//tei:edition"/>
                            <xsl:apply-templates select = "//tei:editionStmt//tei:respStmt"/>
                            
                        </div>
                    </div>

                                        
                    <!--creo un footer-->
                    <footer id="footer">
                        <xsl:apply-templates select = "//tei:publicationStmt"/>
                        <xsl:apply-templates select = "//tei:textClass"/>
                        <xsl:apply-templates select = "//tei:back//tei:listBibl"/>
                    </footer>

                </body>

            </html>

        </xsl:template>



        
        <!--template per le informazioni sulla lettera-->

        <!--div InfoLettera-->
        <xsl:template match="tei:profileDesc">
            <h3>Informazioni sulla lettera</h3>
                
            <b>Mittente:</b><xsl:text> </xsl:text><xsl:value-of select="current()//tei:correspAction[@type='sent']//tei:persName"/><br/>
            <b>Destinatario:</b><xsl:text> </xsl:text><xsl:value-of select="current()//tei:correspAction[@type='received']"/><br/>
            <b>Luogo:</b><xsl:text> </xsl:text><xsl:value-of select="current()//tei:correspAction[@type='sent']//tei:placeName"/><br/>
            <b>Data:</b><xsl:text> </xsl:text><xsl:value-of select="current()//tei:correspAction[@type='sent']//tei:date"/><br/>
            <b>Contesto:</b><xsl:text> </xsl:text><xsl:value-of select="current()//tei:correspContext"/><br/>
            <b>Lingua:</b><xsl:text> </xsl:text><xsl:value-of select="current()//tei:langUsage"/><br/>
        </xsl:template>

        <xsl:template match="tei:back//tei:note">
            <xsl:for-each select="current()//tei:p"> 
                <xsl:apply-templates/><br/>
            </xsl:for-each>
        </xsl:template>

        
        <!--div collocazione-->
        <xsl:template match="tei:msDesc">
            <h3>Collocazione della lettera</h3>
            <xsl:value-of select="current()//tei:altIdentifier"/><br/>
            <xsl:value-of select="current()//tei:repository"/>,
            <xsl:value-of select="current()//tei:settlement"/>,
            <xsl:value-of select="current()//tei:country"/><br/>
            Segnatura della lettera:<xsl:value-of select="current()//tei:idno"/><br/>
            <xsl:value-of select="current()//tei:note"/>
        </xsl:template>


        <!--testo lettera-->    
        <xsl:template match="tei:lb">
            <xsl:choose>
                <xsl:when test= "@n='2' or @n='3' or @n='4' or @n='5' ">
                    <br/>
                </xsl:when>

                <xsl:when test="@n='6'">
                    <br/>
                    <br/>
                </xsl:when>
            </xsl:choose>

            <span>
                <xsl:attribute name = "style">
                    <xsl:text>display:none</xsl:text>
                </xsl:attribute>
                <xsl:attribute name = "class">
                    <xsl:text>riga</xsl:text>
                </xsl:attribute>
                <xsl:attribute name ="id">
                    <xsl:value-of select = "translate(current()/@facs, '#','')"/>
                </xsl:attribute>
                <b><xsl:value-of select = "@n"/>--></b>
            </span>

        </xsl:template>

       

        <xsl:template match="tei:div[@type='fronte-recto']"> 

                <xsl:choose>
                    <xsl:when test="tei:div[@type='letter-body']">
                        <div id="01" class="p1"> 
                            <p><xsl:apply-templates/></p>
                        </div>
                    </xsl:when> 

                    <xsl:when test="tei:div[@type='closer']">
                        <div id="02" class="p1"> 
                            <p><xsl:apply-templates/></p>

                        </div>
                    </xsl:when> 
                </xsl:choose>

        </xsl:template>



        <xsl:template match="tei:body//tei:div[@type='paratext']">
            <div id="04" class="p1"> 
                <br/>
                <div>
                    <xsl:text>&#160;</xsl:text>
                    <p style="display:none" class="riga" id="paratext"><b><u>Testo della lettera di Michele Carafa</u></b></p>
                </div>
            </div>
        </xsl:template>
                   

        <xsl:template match="tei:body//tei:div[@type='fronte-verso']"> 
            <div id="05" class="p4">
                <p>Annotazione illeggibile a matita presente in alto a sinistra</p>
            </div>
        </xsl:template>



        <!--attribuzione colori a persone e luoghi-->
        <xsl:template match = "tei:persName">
            <a class = "person">
               <xsl:apply-templates/>
            </a>
        </xsl:template>

        <xsl:template match = "tei:placeName">
            <a class = "place">
               <xsl:apply-templates/>
            </a>
        </xsl:template>



        
        <!--legenda-->
        <xsl:template match="tei:sourceDesc//tei:head">
            <h3><xsl:apply-templates/></h3>
        </xsl:template>

        <xsl:template match="tei:sourceDesc//tei:person">
            <div>
                <xsl:attribute name = "id">
                    <xsl:value-of select = "current()/@xml:id"/>
                </xsl:attribute>

                <xsl:attribute name = "class">
                    <xsl:text>persona</xsl:text>
                </xsl:attribute>

                <p>
                    <p> <b><xsl:for-each select="current()//tei:forename">
                       <xsl:apply-templates/><xsl:text> </xsl:text>
                    </xsl:for-each>

                    <xsl:value-of select="current()//tei:surname"/></b></p>
                                                      
                    <p>(<xsl:value-of select = "current()//tei:birth//tei:placeName//tei:settlement[@type='municipality']"/>,
                    <xsl:value-of select = "current()//tei:birth//tei:placeName//tei:country"/>,
                    <xsl:value-of select="current()//tei:birth//tei:date"/> -

                    <xsl:value-of select = "current()//tei:death//tei:placeName//tei:settlement[@type='municipality']"/>,
                    <xsl:value-of select = "current()//tei:death//tei:placeName//tei:country"/>,
                    <xsl:value-of select="current()//tei:death//tei:date"/>)</p>

                    <xsl:choose>
                        <xsl:when test="current()//tei:persName/@role='composer'">
                           <p><i>Compositore</i></p>
                        </xsl:when>
                    </xsl:choose>

                    <p><xsl:for-each select="current()//tei:addName">
                        Alias:<xsl:apply-templates/>
                    </xsl:for-each></p>

                    <xsl:for-each select="current()//tei:roleName">
                        <p><xsl:apply-templates/></p>
                    </xsl:for-each>
                    
                    <xsl:value-of select="current()//tei:note//tei:p"/><br/>

                </p>
            </div>

        </xsl:template>


        

        <xsl:template match="tei:sourceDesc//tei:listPlace">
            <h3><xsl:value-of select="current()//tei:head"/></h3>
            <xsl:value-of select="current()//tei:place//tei:placeName"/>,
            <xsl:value-of select="current()//tei:place//tei:country"/>
        </xsl:template>


        <!--div caratteristicheLettera-->
        <xsl:template match="tei:physDesc">

            <h3>Caratteristiche della lettera</h3>

            <p><b>Materiale</b></p>
            <p><xsl:value-of select = "current()//tei:material"/></p><br/>

            <p><b>Numero foli</b></p>
            <p><xsl:value-of select = "current()//tei:measure"/>
            (<xsl:value-of select ="current()//tei:dimensions//tei:height"/>
            x<xsl:value-of select = "current()//tei:dimensions//tei:width"/>
            <xsl:value-of select="current()//tei:dimensions/@unit"/>)</p>
            <p><xsl:value-of select = "current()//tei:foliation"/></p><br/>

            <p><b>Stato di conservazione</b></p>
            <p><xsl:value-of select = "current()//tei:condition"/></p><br/>

            <p><b>Scrittura</b></p>
            <p><xsl:value-of select = "current()//tei:handDesc"/></p><br/>

            <p><b>Descrizione</b></p>
            <p><xsl:value-of select = "current()//tei:support//tei:p"/></p>
            
        </xsl:template>



        <!--div InfoProgetto-->
        <xsl:template match = "tei:fileDesc//tei:respStmt">
             
            <p><b><xsl:value-of select="current()//tei:resp"/>:</b></p>

            <xsl:for-each select="current()//tei:name">
                <p><xsl:apply-templates/></p>
            </xsl:for-each>
            
            <xsl:value-of select="current()//tei:note"/><br/>
                     
        </xsl:template>

        <xsl:template match = "tei:edition"> 
            <p><b><i><xsl:apply-templates/></i></b></p>
            <!--<br/><br/>-->
        </xsl:template>

      


        <!--footer-->
        <xsl:template match = "tei:publicationStmt">
            <xsl:value-of select = "current()//tei:publisher"/>, 
            <xsl:value-of select = "current()//tei:licence"/><br/>
        </xsl:template>

         <xsl:template match = "tei:textClass">
            Soggettario di riferimento: <xsl:value-of select = "current()//tei:keywords/@scheme"/><br/>
        </xsl:template>


        <xsl:template match="tei:back//tei:listBibl">
            <xsl:value-of select="current()//tei:head"/>:
            <xsl:value-of select="current()//tei:author"/>,
            <xsl:value-of select="current()//tei:date"/>,
            pagina<xsl:value-of select="current()//tei:citedRange"/>
        </xsl:template>
          

</xsl:stylesheet>

