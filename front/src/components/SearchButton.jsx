import React from 'react';
import { Button } from 'antd';

const SearchButton = ({ onClick }) => {
    return (
        <Button type="secondary" shape="square" size="large" onClick={onClick} id='search-button'>
            Search
        </Button>
    );
};

export default SearchButton;