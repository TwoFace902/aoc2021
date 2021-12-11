cumLord :: [Int] -> Int -> Int
cumLord (a:b:rest) count = if (b > a) then cumLord (b:rest) (count + 1) else cumLord (b:rest) count
cumLord [a] count = count

cumDemon :: [Int] -> Int -> Int
cumDemon (a:b:c:d:rest) count = if ((b + c + d) > (a + b + c)) then cumDemon (b:c:d:rest) (count + 1) else cumDemon (b:c:d:rest) count
cumDemon _ count = count

fileRead :: FilePath -> IO [Int]
fileRead file = do
	cock <- readFile file
	return (parseFile cock)
	

parseFile :: String -> [Int]
parseFile string = map read (lines string)

main :: IO ()
main = do
	cope <- fileRead "input.txt"
	putStr ("Silver: ")
	print (cumLord cope 0)
	putStr ("Gold: ")
	print (cumDemon cope 0)

