
// librray for TokenDets
library TokenDetArrayLib {
    // Using for array of strcutres for storing mintable address and token id
    using TokenDetArrayLib for TokenDets;

    struct TokenDet {
        address NFTAddress;
        uint256 tokenID;
    }

    // custom type array TokenDets
    struct TokenDets {
        TokenDet[] array;
    }

    function addTokenDet(
        TokenDets storage self,
        address _mintableaddress,
        uint256 _tokenID
    ) public {
        if (!self.exists(_mintableaddress, _tokenID)) {
            self.array.push(TokenDet(_mintableaddress, _tokenID));
        }
    }

    function getIndexByTokenDet(
        TokenDets storage self,
        address _mintableaddress,
        uint256 _tokenID
    ) internal view returns (uint256, bool) {
        uint256 index;
        bool exists = false;
        for (uint256 i = 0; i < self.array.length; i++) {
            if (
                self.array[i].NFTAddress == _mintableaddress &&
                self.array[i].tokenID == _tokenID
            ) {
                index = i;
                exists = true;
                break;
            }
        }
        return (index, exists);
    }

    function removeTokenDet(
        TokenDets storage self,
        address _mintableaddress,
        uint256 _tokenID
    ) internal returns (bool) {
        (uint256 i, bool exists) = self.getIndexByTokenDet(
            _mintableaddress,
            _tokenID
        );
        if (exists == true) {
            self.array[i] = self.array[self.array.length - 1];
            self.array.pop();
            return true;
        }
        return false;
    }

    function exists(
        TokenDets storage self,
        address _mintableaddress,
        uint256 _tokenID
    ) internal view returns (bool) {
        for (uint256 i = 0; i < self.array.length; i++) {
            if (
                self.array[i].NFTAddress == _mintableaddress &&
                self.array[i].tokenID == _tokenID
            ) {
                return true;
            }
        }
        return false;
    }
}
// library for erc20address array 
library ERC20Addresses {
    using ERC20Addresses for erc20Addresses;

    struct erc20Addresses {
        address[] array;
    }

    function addErcTokens(erc20Addresses storage self, address erc20address)
        external
    {
        self.array.push(erc20address);
    }

    function getIndexByErcToken(
        erc20Addresses storage self,
        address _ercTokenAddress
    ) internal view returns (uint256, bool) {
        uint256 index;
        bool exists;

        for (uint256 i = 0; i < self.array.length; i++) {
            if (self.array[i] == _ercTokenAddress) {
                index = i;
                exists = true;

                break;
            }
        }
        return (index, exists);
    }
    function exists(
        erc20Addresses storage self,
        address _ercTokenAddress
    ) internal view returns (bool) {
        for (uint256 i = 0; i < self.array.length; i++) {
            if (
                self.array[i] == _ercTokenAddress 
            ) {
                return true;
            }
        }
        return false;
    }
}