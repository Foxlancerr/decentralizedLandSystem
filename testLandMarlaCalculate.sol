// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Test {
    struct Info {
        uint256 ID;
        uint256[] X_Axis;
        uint256[] Y_Axis;
        uint256 Height;
        uint256 Width;
        uint256 Area;
        uint256 PerMarlaPrice;
        uint256 LandPrice;
    }

    uint256 constant PRICE_PER_MARLA = 10; // 2 lac (200,000) currency units
    uint256 constant SQUARE_FEET_PER_MARLA = 272;

    mapping(uint256 => Info) public LANDENTRY;

    function setAllDetails(
        uint256 _id,
        uint256 _startX,
        uint256 _endX,
        uint256 _startY,
        uint256 _endY,
        uint256 _perMarlaPrice
    ) public {
        LANDENTRY[_id].ID = _id;
        setXAxis(_id, _startX, _endX);
        setYAxis(_id, _startY, _endY);
        setHeight(_id);
        setWidth(_id);
        setArea(_id);
        setMarlaCost(_id, _perMarlaPrice);
        LANDENTRY[_id].LandPrice = calculateCost(_id);
    }


    // Function to calculate the cost for a given area in square feet
    function calculateCost(uint256 _id)
        private view
        returns (uint256)
    {
        uint decimal = LANDENTRY[_id].Area * 10**18;
        uint256 numberOfMarlas = decimal / SQUARE_FEET_PER_MARLA ;
        uint256 totalCost = numberOfMarlas * LANDENTRY[_id].PerMarlaPrice;
        return totalCost;
    }

    function setMarlaCost(uint256 _id, uint256 _perMarlaCost) public {
        LANDENTRY[_id].PerMarlaPrice = _perMarlaCost;
    }

    function setXAxis(
        uint256 _id,
        uint256 _startX,
        uint256 _endX
    ) private {
        if (LANDENTRY[_id].X_Axis.length > 1) {
            LANDENTRY[_id].X_Axis = new uint256[](0);
            LANDENTRY[_id].X_Axis.push(_startX);
            LANDENTRY[_id].X_Axis.push(_endX);
        } else {
            LANDENTRY[_id].X_Axis.push(_startX);
            LANDENTRY[_id].X_Axis.push(_endX);
        }
    }

    function setYAxis(
        uint256 _id,
        uint256 _startY,
        uint256 _endY
    ) private {
        if (LANDENTRY[_id].Y_Axis.length > 1) {
            LANDENTRY[_id].Y_Axis = new uint256[](0);
            LANDENTRY[_id].Y_Axis.push(_startY);
            LANDENTRY[_id].Y_Axis.push(_endY);
        } else {
            LANDENTRY[_id].Y_Axis.push(_startY);
            LANDENTRY[_id].Y_Axis.push(_endY);
        }
    }

    function setHeight(uint256 _id) private {
        LANDENTRY[_id].Height =
            LANDENTRY[_id].X_Axis[1] -
            LANDENTRY[_id].X_Axis[0];
    }

    function setWidth(uint256 _id) private {
        LANDENTRY[_id].Width =
            LANDENTRY[_id].Y_Axis[1] -
            LANDENTRY[_id].Y_Axis[0];
    }

    function setArea(uint256 _id) private {
        LANDENTRY[_id].Area = LANDENTRY[_id].Width * LANDENTRY[_id].Height;
    }

    function veiwInfo(uint256 _id)
        public
        view
        returns (
            uint256 _Rid,
            uint256[] memory _x_axis,
            uint256[] memory _y_axis,
            uint256 _height,
            uint256 _width,
            uint256 _area,
            uint256 _cost
        )
    {
        _Rid = LANDENTRY[_id].ID;
        _x_axis = LANDENTRY[_id].X_Axis;
        _y_axis = LANDENTRY[_id].X_Axis;
        _height = LANDENTRY[_id].Height;
        _width = LANDENTRY[_id].Width;
        _area = LANDENTRY[_id].Area;
        _cost = LANDENTRY[_id].LandPrice;
    }
}

