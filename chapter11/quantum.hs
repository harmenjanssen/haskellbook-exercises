convert :: Quantum -> Bool
convert Yes  = True
convert No   = True
convert Both = True

convert2 :: Quantum -> Bool
convert2 Yes  = False
convert2 No   = False
convert2 Both = False

convert3 :: Quantum -> Bool
convert3 Yes  = False
convert3 No   = True
convert3 Bool = True

convert4 :: Quantum -> Bool
convert4 Yes  = True
convert4 No   = False
convert4 Bool = True

convert5 :: Quantum -> Bool
convert5 Yes  = True
convert5 No   = True
convert5 Bool = False

convert6 :: Quantum -> Bool
convert6 Yes  = True
convert6 No   = False
convert6 Bool = False

convert7 :: Quantum -> Bool
convert7 Yes  = False
convert7 No   = True
convert7 Bool = False

convert8 :: Quantum -> Bool
convert8 Yes  = False
convert8 No   = False
convert8 Bool = True

