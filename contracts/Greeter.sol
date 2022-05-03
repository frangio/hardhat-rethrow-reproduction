// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract A {
    uint counter;

    function test() external {
        counter++;
        revert("a reason");
    }
}

contract B {
    A a = new A();

    function testGood() external {
        a.test();
    }

    function testBad() external {
        (bool ok, bytes memory data) = address(a).call(abi.encodeCall(A.test, ()));
        if (!ok) {
            assembly {
                revert(add(32, data), mload(data))
            }
        }
    }
}
