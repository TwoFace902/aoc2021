data Direction = D | W | S

type Pos = (Int,Int)
type Cope = (Direction, Int)
type Mald = ((Int,Int), Int)

fileRead :: FilePath -> IO [Cope]
fileRead file = do
	cock <- readFile file
	return (parseFile cock)
	
parseFile :: String -> [Cope]
parseFile string = map readLine (lines string)

readLine :: String -> Cope
readLine t = tuple where
	 l = words t
	 dir = getDir (l !! 0)
	 len = read (l !! 1)
	 tuple = (dir,len)
	
getDir :: String -> Direction
getDir "forward" = D
getDir "up" = W
getDir "down" = S

doShit :: Cope -> Pos -> Pos
doShit (D,n) (x,y) = (x + n, y)
doShit (W,n) (x,y) = (x, y + n)
doShit (S,n) (x,y) = (x, y - n)

reallyDoShit :: [Cope] -> Pos -> Int
reallyDoShit (a:rest) pos = result where
	cope = doShit a pos
	result = reallyDoShit rest cope
reallyDoShit [] (x,y) = x * (-y)

fuck :: Cope -> Mald -> Mald
fuck (D,n) ((x,y),a) = ((x + n, y + n * a),a)
fuck (W,n) ((x,y),a) = ((x,y),a + n)
fuck (S,n) ((x,y),a) = ((x,y),a - n)

reallyFuck :: [Cope] -> Mald -> Int
reallyFuck (nig:chuck) gers = sneed where
	i = fuck nig gers
	sneed = reallyFuck chuck i
reallyFuck [] ((x,y),_) = x * (-y)

main :: IO ()
main = do
	chuck <- fileRead "input.txt"
	putStr ("Silver: ")
	print (reallyDoShit chuck (0,0))
	putStr ("Gold: ")
	print (reallyFuck chuck ((0,0),0))