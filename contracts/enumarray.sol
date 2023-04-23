//enum과 array의 차이

//이넘은 나열형, 연관된 상수를 묶어 값을 지정하는 자료형 
// 같은 이름을 가지게 되는 상수끼리 충돌 방지, 가독성을 좋게한다. 

enum Fruits {apple,banana,peach}
enum Fruits {apple,banana=5,peach}

enum Gold {gold,silver,bronze}
enum Ranking {gold=1,silver,bronze}
Ranking foo = Ranking.gold;
Ranking doo = Ranking.silver;
Ranking soo = Ranking.bronze;


contract Array {
    // Several ways to initialize an array
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];

 function get(uint i) public view returns (uint) {
        return arr[i];
    }

}

contract ArrayRemoveByShifting {
    uint[] public arr;

    function test() external {
        arr = [1, 2, 3, 4, 5];
}


