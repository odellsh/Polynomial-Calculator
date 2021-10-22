{-
 - polynimial division
 - Sydney O'Dell, Sydney M, Emely O
 -
 -}

import Data.List


--defines a type that holds list of (coefficients, exponents)
type Poly = [(Float,Integer)]
--defines a type that holds a list of coefficients
type Poly2 = [Float]


--function that adds two polynomial lists based on their exponents
--if the exponenets are equal, then the coefficients are added together
addition :: Poly -> Poly -> Poly
addition [] []                 = []
addition ((c,d):xs) []         = ((c,d):xs)
addition [] ((e,f):ys)         = ((e,f):ys)
addition ((c,d):xs) ((e,f):ys) | d < f  = ((c,d) : (addition xs ((e,f):ys)))
                               | d > f  = ((e,f) : (addition ((c,d):xs) ys))
                               | d == f = ((c+e,d) : (addition xs ys))


--function that subtracts two polynomial lists based on their exponents 
--if the exponenets are equal, then the coefficients are subtracted
subtraction :: Poly -> Poly -> Poly
subtraction [] []                 = []
subtraction ((c,d):xs) []         = ((c,d):xs)
subtraction [] ((e,f):ys)         = ((e,f):ys)
subtraction ((c,d):xs) ((e,f):ys) | d < f  = ((c,d)   : (subtraction xs ((e,f):ys)))
                                  | d > f  = ((e,f)   : (subtraction ((c,d):xs) ys))
                                  | d == f = ((c-e,d) : (subtraction xs ys))


--function to perform multiplication on two lists of coefficients
multiplication :: Poly2 -> Poly2 -> Poly2
multiplication [] ys = []
multiplication (p:p1) p2 = addPoly (multiplyBy p p2) (multiplyByX $ multiplication p1 p2)


--helper function that adds the coefficients
addPoly :: Poly2 -> Poly2 -> Poly2 
addPoly xs ys = if (length xs >= length ys)
                then zipWith (+) xs (ys ++ repeat 0)
                else addPoly ys xs


--helper funciton that distributes the float value to the list of coefficients
multiplyBy :: Float -> Poly2 -> Poly2
multiplyBy a p1 = map (a*) p1


--helper function that pads a 0 to a list of coefficient values to make them 
--line up in decreasing left to right exponent values and shift right one degree
multiplyByX :: Poly2 -> Poly2
multiplyByX p = 0:p


--function that divides polynomials
division :: Poly2 -> Poly2 -> Poly2
division [] _ = []
division (x:xs) y | length (x:xs) < length y = []
                  | otherwise = z : (division (tail (subPoly (x:xs) (multiplication [z] y))) y)
                  where z = x / head y              


--function that gets the remainder from long division
remainder :: Poly2 -> Poly2 -> Poly2
remainder [] _ = []
remainder (x:xs) y | length (x:xs) < length y = (x:xs)
                   | otherwise = remainder (tail (subPoly (x:xs) (multiplication [z] y))) y
                   where z = x / head y


--funtion that subtracts the coefficients
subPoly :: Poly2 -> Poly2 -> Poly2 
subPoly xs ys = if (length xs >= length ys)
                then zipWith (-) xs (ys ++ repeat 0)
                else subPoly ys xs
 

--helper function to take in a list of tuples and output a list of the exponents
isExp :: Poly -> [Integer]
isExp [] = []
isExp [(c,d)] = d : isExp []
isExp ((c,d):xs) = d : isExp xs


--helper function to take in a list of tuples and output a list of the coefficients
isCo :: Poly -> [Float]
isCo [] = []
isCo [(c,d)] = c : isCo []
isCo ((c,d):xs) = c : isCo xs


--function to flip the sign of the coefficient of type Poly
negation :: Poly -> Poly
negation [] = []
negation ((c,d):xs) = (((negate(c)),d) : negation xs)


--function to find the derivative of a list of polynomials 
deriv :: [(Float,Float)]  -> [(Float,Float)]
deriv [] = []
deriv ((c,d):xs) = (((c * d),d-1) : deriv xs)


main :: IO()
main = do
  putStrLn "Welcome to the Polynomial Haskell Calculator"
  putStrLn "Final Project                         CS3490"
  putStrLn "Sydney Magee & Sydney O'Dell & Emely Ovando"
  putStrLn "Accepted Format: [(coefficient,exponent),...]"
  putStrLn "Example: [(4,5),(0,4),(3,3),(0,2),(6,1),(9,0)]"
  putStrLn ("     ")
  putStrLn "Enter polynomial one"
  poly1 <- fmap (read :: String -> Poly) getLine
  putStrLn "Enter polynomial two or type Ctrl+C to exit"
  poly2 <- fmap (read :: String -> Poly) getLine
  putStrLn ("|------------------------Calculator Operands----------------------|")
  putStrLn ("|-----------------------------------------------------------------|")
  putStrLn ("|-----i. Addition----------ii. Subtraction-----iii. Negation------|")
  putStrLn ("|-----------------------------------------------------------------|")
  putStrLn ("|----iv. Multiplication-----v. Division---------vi. Remainder-----|")
  putStrLn ("|-----------------------------------------------------------------|")
  putStrLn ("     ")
  putStrLn ("Please select an operand from above:")
  inputOperand <- getLine
  putStrLn ("     ")
  case inputOperand of
    ('i':[])         -> print$addition poly1 poly2
    ('i':'i':[])     -> print$subtraction poly1 poly2
    ('i':'i':'i':[]) -> print$negation poly1 
    ('i':'v':[])     -> print$(multiplication (isCo poly1) (isCo poly2))
    ('v':[])         -> print$(division (isCo poly1) (isCo poly2))
    ('v':'i':[])     -> print$(remainder (isCo poly1) (isCo poly2))

