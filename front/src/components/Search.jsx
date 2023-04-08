import React from "react";
import { Input } from "antd";
import SearchButton from "./SearchButton";

const { Search } = Input;

const SearchBar = ({ onChange, onClick }) => {
    return (
        <div style={{ display: "flex", alignItems: "center" }}>
            <Search
                placeholder="Search..."
                allowClear
                onChange={(e) => {
                    onChange(e.target.value);
                }}
                onPressEnter={onClick}
                style={{ width: "75%" }}
            />
            <SearchButton onClick={onClick} />
        </div>
    );
};

export default SearchBar;