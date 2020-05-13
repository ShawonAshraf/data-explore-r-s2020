2
-

For a small sample of German particle and base verbs, Table 1 presents
corpus-based frequen- cies for some direct object nouns. Create vectors
for each particle and each base verb in the table, and double-check that
all vectors

-   contain only numerical values, and
-   are of equal length.

Then normalise the vectors such that the sum of each vector’s dimension
values equals 1.

`norm <- vector / sum(vector)`

    # creating vectors

    abschminken <- c(35,13,88,75,5,66)
    anfressen <- c(1,53,0,0,23,2)
    aufschaukeln <- c(28,3,0,18,1,23)
    nachkochen <- c(0,250,15,77,24)

    fressen <- c(0,99,2,44,38,22)
    kochen <- c(0,26,0,12,86,8)
    schaukeln <- c(68,7,11,31,2,24)
    schminken <- c(41,3,38,4,0,5)

    # check value types and length
    mode(abschminken)

    ## [1] "numeric"

    length(abschminken)

    ## [1] 6

    # normalizing
    # normalize in such a way that the sum of the dimensions == 1
    # vector / sum(vector)

    abschminken.norm <- abschminken / sum(abschminken)                                                                                
    anfressen.norm <- anfressen / sum(anfressen)                                                                                                        
    aufschaukeln.norm <- aufschaukeln / sum(aufschaukeln)                                                                                               
    nachkochen.norm <- nachkochen / sum(nachkochen)                                                                                                     

    fressen.norm <- fressen / sum(fressen)                                                                                                              
    kochen.norm <- kochen / sum(kochen)                                                                                                                 
    schaukeln.norm <- schaukeln / sum(schaukeln)                                                                                                        
    schminken.norm <- schminken / sum(schminken)  

3
-

For the same sample of verbs, Table 2 presents corpus-based frequencies
for some preposi- tions in prepositional phrase objects. Extend your
verb vectors to incorporate the additional dimensions, and once more
double-check that all vectors

-   contain only numerical values,
-   are of equal length,
-   are normalised.

<!-- -->

    # vectors for preposition particles
    abschminken.p <- c(26, 83, 36, 12, 99)                                                                                                              
    anfressen.p <- c(77, 12, 24, 45, 1)                                                                                                                 
    aufschaukeln.p <- c(75, 45, 85, 31, 34)                                                                                                             
    nachkochen.p <- c(79, 33, 69, 24, 59)                                                                                                               

    fressen.p <- c(25, 25, 55, 82, 79)                                                                                                                  
    kochen.p <- c(47, 49, 58, 58, 12)                                                                                                                   
    schaukeln.p <- c(35, 63, 34, 32, 2)                                                                                                                 
    schminken.p <- c(22, 51, 34, 12, 3)     

    # normalize again
    abschminken.p.norm <- abschminken.p / sum(abschminken.p)                                                                                            
    anfressen.p.norm <- anfressen.p / sum(anfressen.p)                                                                                                  
    aufschaukeln.p.norm <- aufschaukeln.p / sum(aufschaukeln.p)                                                                                         
    nachkochen.p.norm <- nachkochen.p / sum(nachkochen.p)                                                                                               

    fressen.p.norm <- fressen.p / sum(fressen.p)                                                                                                        
    kochen.p.norm <- kochen.p / sum(kochen.p)                                                                                                           
    schaukeln.p.norm <- schaukeln.p / sum(schaukeln.p)                                                                                                  
    schminken.p.norm <- schminken.p / sum(schminken.p)    

Check if the sum is actually 1

    sum(schminken.p.norm)

    ## [1] 1

    ### concatenate normalised vectors:

    abschminken.all.norm2 <- c(abschminken.norm, abschminken.p.norm)                                                                                    
    anfressen.all.norm2 <- c(anfressen.norm, anfressen.p.norm)                                                                                          
    aufschaukeln.all.norm2 <- c(aufschaukeln.norm, aufschaukeln.p.norm)                                                                                 
    nachkochen.all.norm2 <- c(nachkochen.norm, nachkochen.p.norm)                                                                                       

    schminken.all.norm2 <- c(schminken.norm, schminken.p.norm)                                                                                          
    fressen.all.norm2 <- c(fressen.norm, fressen.p.norm)                                                                                                
    schaukeln.all.norm2 <- c(schaukeln.norm, schaukeln.p.norm)                                                                                          
    kochen.all.norm2 <- c(kochen.norm, kochen.p.norm)                                                                                                      

    ### normalise concatenated verb vectors:

    abschminken.all.norm <- abschminken.all.norm2 / sum(abschminken.all.norm2)                                                                          
    anfressen.all.norm <- anfressen.all.norm2 / sum(anfressen.all.norm2)                                                                                
    aufschaukeln.all.norm <- aufschaukeln.all.norm2 / sum(aufschaukeln.all.norm2)                                                                       
    nachkochen.all.norm <- nachkochen.all.norm2 / sum(nachkochen.all.norm2)                                                                             

    schminken.all.norm <- schminken.all.norm2 / sum(schminken.all.norm2)                                                                                
    fressen.all.norm <- fressen.all.norm2 / sum(fressen.all.norm2)                                                                                      
    schaukeln.all.norm <- schaukeln.all.norm2 / sum(schaukeln.all.norm2)                                                                                
    kochen.all.norm <- kochen.all.norm2 / sum(kochen.all.norm2)     

4
-

Compute the difference vectors for the particle verbs and the respective
base verbs

    abschminken.comp  <- abschminken.all.norm  - schminken.all.norm                                                                                       
    anfressen.comp    <- anfressen.all.norm    - fressen.all.norm                                                                                       
    aufschaukeln.comp <- aufschaukeln.all.norm - schaukeln.all.norm                                                                                     
    nachkochen.comp   <- nachkochen.all.norm   - kochen.all.norm 

    ## Warning in nachkochen.all.norm - kochen.all.norm: longer object length is not a
    ## multiple of shorter object length

5
=

Compute the sums of the difference vectors, and (manually) sort the
particle/base verb pairs according to the difference in their sums.
Which are the most similar combinations of particle verb and base verb,
i.e., which are the most compositional particle verbs, assuming that
vector similarity indicates compositionality?

    abschminken.comp.sum <- sum(abs(abschminken.comp))
    anfressen.comp.sum <- sum(abs(anfressen.comp))
    aufschaukeln.comp.sum <- sum(abs(aufschaukeln.comp))
    nachkochen.comp.sum <- sum(abs(nachkochen.comp))

    save.image(file="ex_01_sol.RData")
