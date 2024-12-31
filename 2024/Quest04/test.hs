import Test.Hspec
import qualified Solve

main :: IO ()
main = hspec $ do
  describe "Part 1" $ do
    it "hammers nails in" $ do
      Solve.part1 "2\n4\n6" `shouldBe` 6
    it "works with given example" $ do
      Solve.part1 "3\n4\n7\n8" `shouldBe` 10

  describe "Part 2" $ do
    it "works with given example" $ do
      Solve.part2 "3\n4\n7\n8" `shouldBe` 10

  describe "Part 3" $ do
    it "hammers nails in AND out" $ do
      Solve.part3 "2\n4\n6" `shouldBe` 4
    it "works with given example" $ do
      Solve.part3 "2\n4\n5\n6\n8" `shouldBe` 8
