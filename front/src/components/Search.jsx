import React from "react";
import SearchBar from "./SearchBar";
import SearchButton from "./SearchButton";

const Search = ({ onChange, onExecute }) => {
    return (
        <div style={{ display: "flex", alignItems: "center" }}>
            <SearchBar onChange={onChange} onPressEnter={onExecute} />
            <SearchButton onClick={onExecute} />
        </div>
    );
};

export default Search;