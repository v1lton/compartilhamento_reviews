import React from 'react';
import { Input } from "antd";

const SearchBar = ({ onChange, onPressEnter }) => {
    return (
        <Input
            allowClear
            style={{ width: "75%" }}
            placeholder="Search"
            onChange={(e) => { onChange(e.target.value); }}
            onPressEnter={onPressEnter}
            id='search-input'
        />
    );
}

export default SearchBar;