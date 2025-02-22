---
tags:
  - css
  - html
---
A baseline-effective approach for styling a table such that it adapts to smaller viewports while always preserving whatever minimum space each column needs to display its cells' contents legibly enough. 

Unglamorous; there are definitely better, richer ways to handle responsive tabular data, but a useful illustration of table column width mechanics and if nothing else, something workable to keep in the back pocket.

```js
/*

calculateMinWidth derives a minimum width for a table based on the widths of its columns, to ensure the table doesn't collapse unpredictably / unreadably on smaller viewports.

  
- header cell width dictates column width

- explicitly set widths pin a cell to that width, preventing from shrinking below, but also from expanding beyond as the table gets wider

- { sm: '160px', md: 'auto' } pattern helps content that doesn't truncate gracefully adapt on smaller views
    - on small viewports, stick to 160px (or whatever width makes sense for the content)
    - on medium + large viewports, auto-expand to fill the remaining space (could also consider a percentage width here)

- width: npx; pin a column to that width in all contexts; used mainly for supporting content, to prevent it from taking up too much space on larger viewports

- this leaves cells without any sort of explicit width; they'll expand and shrink with the table, trouble being that, if other cells have set widths and those widths add up to more space than the viewport, those columns will collapse entirely, disappearing

To solve for this last problem, we calculate a minimum table width based on the sum of the widths of the columns that have an explicit width and default width-less columns to a sensible (experimentally determined) minimum width.

This approach handles responsiveness by saying tables at smaller viewports should overflow their container and the user needs to horizontally scroll. This approach ensures the table stays readable on smaller viewports, preserving a baseline width that accommodates all its columns, while expanding more or less gracefully with more real estate.

*/

interface Col {
    width: string | {
	    sm: string;
	    md?: string;
	    lg?: string;
	    xl?: string;
    }
}

/*

This approach was written for MUI, with the `width` value passed directly to MUI's `sx` inline styling helper; generalizable to vanilla CSS via media queries. 

The idea is that we need a minimum width for a column to calculate a minimum table width, so we take either the column's fixed width or the width value of the smallest defined breakpoint for the column. The below solution needs work to handle arbitrary break point configurations, accepts only `width.sm` as the breakpoint-based min-width.
*/
  

const calculateMinWidth = (columns: Col, defaultWidth = '120px') => {
    const minWidth = `calc(${columns.map((c) => c.width?.sm ?? c.width ?? defaultWidth).join(' + ')})`;

    return minWidth;
};

```


And then used as follows (roughly):

```js
const columns = [
	// Content that shrinks down poorly. Should take up more space as allowed, but whose cells should not shrink below a specific width, experimentally arrived
	// at by eyeballing when, roughly, cell content starts to look bad as table
	// shrinks horizontally
    {
        name: 'Min-Width Content',
        width: { sm: '160px', md: 'auto' }
    },
    // Flexible, usually supporting content. No specific space demands; see how it looks once widths set on all other columns.
    {
        name: 'Flexible Content',
    },
    // Think a kebab menu, edit control; an element that occupies a consistent
    // amount of space
    {
        name: 'Predictable-width Content',
        width: '160px',
    }
];

const minTableWidth = calculateMinWidth(columns);

<table id="#my-table" style=`table-layout: 'fixed'; width: '100%'; min-width: ${minTableWidth}`> ... </table>

```
